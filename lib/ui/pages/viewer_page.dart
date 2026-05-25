import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/drawing_provider.dart';
import '../widgets/viewer/viewer_canvas.dart';

class ViewerPage extends StatelessWidget {
  const ViewerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('CAD Viewer')),
      body: Center(
        child: Consumer<DrawingProvider>(
          builder: (context, provider, _) {
            if (provider.isLoading) {
              return const CircularProgressIndicator();
            }
            if (provider.error != null) {
              return Text('加载失败：${provider.error}');
            }
            return const ViewerCanvas();
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          // 使用 all 类型，取消扩展名过滤
          FilePickerResult? result = await FilePicker.platform.pickFiles(
            type: FileType.any,
          );
          if (result != null && result.files.single.path != null) {
            final filePath = result.files.single.path!;
            // 手动检查扩展名，避免加载不支持的文件
            if (!filePath.toLowerCase().endsWith('.dwg') &&
                !filePath.toLowerCase().endsWith('.dxf')) {
              // 可选：提示用户文件格式不正确
              if (context.mounted) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('请选择 DWG 或 DXF 文件')),
                );
              }
              return;
            }
            // 调用加载
            if (context.mounted) {
              context.read<DrawingProvider>().loadFile(filePath);
            }
          }
        },
        child: const Icon(Icons.file_open),
      ),
    );
  }
}
