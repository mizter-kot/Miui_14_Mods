.class public LMyControlCenterUtils;
.super Ljava/lang/Object;

.field public static myDefaultActiveBgColor:I = 0xff3d84ff # good old miui-ish blue color

.field public static myDefaultDisabledBgColor:I = 0x26ffffff

.field public static myDefaultSliderForegroundColor:I = 0xffffffff

.field public static myDefaultSliderIconColor:I = 0x4d000000

.field public static myDefaultCornerRadius:F

.field public static myDefaultGradientOrientation:Ljava/lang/String; = "LEFT_RIGHT"

.method static constructor <clinit>()V
    .locals 1
    
    const/16 v0, 0x28 # 40
    
    int-to-float v0, v0
    
    sput v0, LMyControlCenterUtils;->myDefaultCornerRadius:F
    
    return-void
.end method

.method public static getStringFromSettings(Landroid/content/ContentResolver;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 0
    
    invoke-static {p0, p1}, Landroid/provider/Settings$System;->getString(Landroid/content/ContentResolver;Ljava/lang/String;)Ljava/lang/String;
    
    move-result-object p0
    
    if-nez p0, :return
    
    move-object p0, p2
    
    :return
    return-object p0
.end method
    
.method public static getMyNewCcSettingsEnabled(Landroid/content/Context;)Z
    .locals 2
    
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;
    
    move-result-object p0
    
    const-string v0, "my_new_cc_settings_enabled"
    
    const/4 v1, 0x0
    
    invoke-static {p0, v0, v1}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I
    
    move-result v1
    
    return v1    
.end method
