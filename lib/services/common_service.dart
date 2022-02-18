import '../utils/request.dart';

/// 请求示例
Future<Object> getDemo() async {
  return Request.get(
    '/api',
    queryParameters: {'key': 'value'},
  );
}

Future<Object> postDemo() async {
  return Request.post('/api', data: {});
}

Future<Object> putDemo() async {
  return Request.put('/api', data: {});
}

/// 获取APP最新版本号, 演示更新APP组件
Future<Map> getNewVersion([String version]) async {
  Map resData = {
    "code": "0",
    "message": "success",
    "data": {
      "version": "2.2.4",
      "info": ["修复bug提升性能", "增加彩蛋有趣的功能页面", "测试功能"]
    }
  };

  // TODO: 替换为你的真实请求接口，并返回数据，此处演示直接返回数据
  // Map res = await Request.get(
  //   '/api',
  //   queryParameters: {'key': 'value'},
  // ).catchError((e) => resData);
  return resData['data'] ?? {};
}
