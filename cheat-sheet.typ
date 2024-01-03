#import "./typstempl/cosheet.typ": cosheet
#show: doc => cosheet(doc)

= java基础
== 去除空格
```java
public String trim(String str) {
    // "\u0020" 半角空格, office空格, 全角空格
    return str.trim().replace("\u00a0", "").replace("\u3000", "");
} 
```
= Spring
== 获取Servlet相关参数
```java
ServletRequestAttributes servletRequestAttributes = (ServletRequestAttributes) RequestContextHolder.getRequestAttributes();
HttpServletResponse response = servletRequestAttributes.getResponse();
HttpServletRequest request = servletRequestAttributes.getRequest();
```
= 类库
== Hutool
=== ExcelUtil
+ example ```java
ServletRequestAttributes servletRequestAttributes = 
(ServletRequestAttributes) RequestContextHolder.getRequestAttributes();
HttpServletResponse response = servletRequestAttributes.getResponse();

ExcelReader reader = ExcelUtil.getReader(FileUtil.file("公务用车车辆管理员信息.xlsx"), 0);
List<Map<String, Object>> carManagerMaps = reader.readAll();
//  所有用车管理员userCode
List<String> carManagersUserCode = carManagerMaps.stream()
        .map(map -> map.get("账号").toString())
        .collect(Collectors.toList());

final List<LinkedHashMap<String, String>> rows = carManagersUserCode.stream().map(userCode -> {
    LinkedHashMap<String, String> row = new LinkedHashMap<>();
    row.put("账号", userCode);
    return row;
}).collect(Collectors.toList());

ExcelWriter excelWriter = ExcelUtil.getWriter();

excelWriter.renameSheet("所有车辆管理员账号");
excelWriter.write(rows, true);

response.setContentType("application/vnd.ms-excel;charset=utf-8");
response.setHeader("Content-Disposition", "attachment;filename=test_1.xls");
ServletOutputStream out = response.getOutputStream();
excelWriter.flush(out, true);

excelWriter.close();
IoUtil.close(out);
```
+ 获取reader
  ```java
    ExcelReader reader = ExcelUtil.getReader(FileUtil.file("path"), 0);
  ```
+ 获取writer
  ```
  ExcelWriter excelWriter = ExcelUtil.getWriter();
  ```
