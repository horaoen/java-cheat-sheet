#import "./typstempl/template/cosheet/cosheet.typ": cosheet
#show: doc => cosheet(doc)

= java基础
== 去除空格
```java
public String trim(String str) {
    // "\u0020" 半角空格, office空格, 全角空格
    return str.trim().replace("\u00a0", "").replace("\u3000", "");
} 
```

= 类库
== Hutool

