# MiuiSystemUIPlugin.apk

## Lmiui/systemui/controlcenter/qs/QSPager;

Добавить в конец:

```smali
.field private myRowsCount:I

.method private getMyRowsCount()I
    .locals 3
    
    invoke-virtual {p0}, Lmiui/systemui/controlcenter/qs/QSPager;->getContext()Landroid/content/Context;
    
    move-result-object v0
    
    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;
    
    move-result-object v0
    
    const-string v2, "my_first_page_rows_count"
    
    const/4 v1, 0x2
    
    invoke-static {v0, v2, v1}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I
    
    move-result v2
    
    add-int/lit8 v2, v2, 0x2 # Add 2 (rows) for the big tiles
    
    return v2
.end method
```

В методе 

```smali
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V 
```

перед `return-void` добавить

```smali
invoke-direct {p0}, Lmiui/systemui/controlcenter/qs/QSPager;->getMyRowsCount()I

move-result v0

iput v0, p0, Lmiui/systemui/controlcenter/qs/QSPager;->myRowsCount:I
```

В методе

```smali
.method private final distributeTiles()V
```

найти

```smali
const/4 v8, 0x4
```

и заменить на

```smali
iget v8, p0, Lmiui/systemui/controlcenter/qs/QSPager;->myRowsCount:I
```

# Settings.apk

`*.xml`

```xml
<XMiuiSeekBarPreference 
    android:title="@string/my_first_page_rows_count_title"
    android:key="my_first_page_rows_count"
    android:defaultValue="2" min="1" max="4" step="1"
    enableSummary="true" />
```
    
`values/strings.xml`

```xml
<string name="my_first_page_rows_count_title">Number of rows of toggles on the first page</string>
```

`values-ru/strings.xml`

```xml
<string name="my_first_page_rows_count_title">Количество рядов тоглов на первой странице</string>
```
