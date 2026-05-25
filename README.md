# CAD Viewer

A cross-platform 2D CAD file viewer built with Flutter，支持 DWG 和 DXF 格式文件的查看。

## 功能

- **DWG文件查看** — 通过 LibreDWG 原生库解析 DWG 文件
- **2D 图形渲染** — 基于 Flutter Canvas 的自定义渲染引擎，支持 LINE、CIRCLE、ARC、POLYLINE、SPLINE、TEXT、MTEXT 等实体类型
- **手势交互** — 双指缩放、单指拖拽平移
- **平台** — 仅支持 Android（未来考虑支持ios和其他）

## 截图
<p align="center">
  <img src="https://raw.githubusercontent.com/TimeRunis/cad-viewer/master/screenshots/1.jpg" width="30%" />
  <img src="https://raw.githubusercontent.com/TimeRunis/cad-viewer/master/screenshots/2.jpg" width="30%" />
  <img src="https://raw.githubusercontent.com/TimeRunis/cad-viewer/master/screenshots/3.jpg" width="30%" />
</p>

### 启动

```bash
flutter pub get
flutter run
```

## 许可证

MIT
