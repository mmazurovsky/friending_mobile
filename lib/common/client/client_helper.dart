abstract class ClientHelper<DATA> {
  String getEndpoint();
  DATA deserialize(dynamic json);
}