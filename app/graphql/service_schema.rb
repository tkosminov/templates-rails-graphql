class ServiceSchema < GraphQL::Schema
  mutation(Types::MutationType)
  query(Types::QueryType)

  use(GraphQL::Execution::Interpreter)
  use(GraphQL::Analysis::AST)
  use(GraphQL::Pagination::Connections)

  use(GraphQL::Batch)

  def self.resolve_type(_abstract_type, obj, _ctx)
    return "::Types::Objects::#{obj.class}".safe_constantize
  end

  def self.id_from_object(object, type_definition, _query_ctx)
    GraphQL::Schema::UniqueWithinType.encode(type_definition.name, object.id)
  end

  def self.object_from_id(id, _query_ctx)
    return unless id.present?

    type_name, item_id = GraphQL::Schema::UniqueWithinType.decode(id)
    type_name = type_name.safe_constantize
    type_name&.find_by(id: item_id)
  end
end
