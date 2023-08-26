.class public LMyControlCenterUtils;
.super Ljava/lang/Object;

.field private static myDefaultActiveBgColor:I = 0xff3d84ff # good old miui-ish blue color

.field private static myDefaultDisabledBgColor:I = 0x26ffffff

.field private static myDefaultSliderForegroundColor:I = 0xffffffff

.field private static myDefaultSliderIconColor:I = 0x4d000000

.field private static myDefaultCornerRadius:F

.field private static myDefaultGradientOrientation:Ljava/lang/String; = "LEFT_RIGHT"

.field private static mCR:Landroid/content/ContentResolver;

.method static constructor <clinit>()V
    .locals 1
    
    const v0, 0x28 # 40
    
    int-to-float v0, v0
    
    sput v0, LMyControlCenterUtils;->myDefaultCornerRadius:F
    
    return-void
.end method

.method private static setCR(Landroid/content/Context;)V
    .locals 0
    
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;
    
    move-result-object p0
    
    sput-object p0, LMyControlCenterUtils;->mCR:Landroid/content/ContentResolver;
    
    return-void
.end method
    
.method public static getMyNewCcSettingsEnabled(Landroid/content/Context;)Z
    .locals 2
    
    invoke-static {p0}, LMyControlCenterUtils;->setCR(Landroid/content/Context;)V
    
    sget-object p0, LMyControlCenterUtils;->mCR:Landroid/content/ContentResolver;
    
    const-string v0, "my_new_cc_settings_enabled"
    
    const/4 v1, 0x0
    
    invoke-static {p0, v0, v1}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I
    
    move-result v1
    
    return v1    
.end method

.method public static getCustomBgDrawableFromStateForBigTile(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;
    .param p0 # context
    .param p1 # state
    .locals 5
    
    invoke-static {p0}, LMyControlCenterUtils;->setCR(Landroid/content/Context;)V
    
    sget-object p0, LMyControlCenterUtils;->mCR:Landroid/content/ContentResolver;
    
    new-instance v0, Landroid/graphics/drawable/GradientDrawable;

    invoke-direct {v0}, Landroid/graphics/drawable/GradientDrawable;-><init>()V
    
    const-string v1, "my_big_tile_bg_gradient_enabled"
    
    const/4 v2, 0x0
    
    invoke-static {p0, v1, v2}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I
    
    move-result v1
    
    if-nez v1, :gradient_enabled
    
    const/4 v1, 0x2
    
    if-ne v1, p1, :disabled_or_unavailable_single_color
    
    const-string v1, "my_active_big_tile_bg_color"
    
    sget v2, LMyControlCenterUtils;->myDefaultActiveBgColor:I
    
    goto :set_single_color
    
    :disabled_or_unavailable_single_color
    if-eqz p1, :unavailable_single_color
    
    const-string v1, "my_disabled_big_tile_bg_color"
    
    sget v2, LMyControlCenterUtils;->myDefaultDisabledBgColor:I
    
    goto :set_single_color
    
    :unavailable_single_color
    const-string v1, "my_unavailable_big_tile_bg_color"
    
    sget v2, LMyControlCenterUtils;->myDefaultDisabledBgColor:I
    
    :set_single_color
    invoke-static {p0, v1, v2}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I
    
    move-result v1

    invoke-virtual {v0, v1}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V
    
    goto :set_stroke_strings
    
    :gradient_enabled
    invoke-virtual {v0, v2}, Landroid/graphics/drawable/GradientDrawable;->setGradientType(I)V # 0x0 = LINEAR_GRADIENT
    
    invoke-static {p1}, LMyControlCenterUtils;->getGradientOrientationForBigTile(I)Landroid/graphics/drawable/GradientDrawable$Orientation;
    
    move-result-object v1
    
    invoke-virtual {v0, v1}, Landroid/graphics/drawable/GradientDrawable;->setOrientation(Landroid/graphics/drawable/GradientDrawable$Orientation;)V
    
    const/4 v1, 0x2
    
    if-ne v1, p1, :disabled_or_unavailable_gradient_colors
    
    const-string v1, "my_active_big_tile_bg_gradient_first_color"
    
    const-string v2, "my_active_big_tile_bg_gradient_second_color"
    
    sget v3, LMyControlCenterUtils;->myDefaultActiveBgColor:I
    
    goto :set_gradient_colors
    
    :disabled_or_unavailable_gradient_colors
    if-eqz p1, :unavailable_gradient_colors
    
    const-string v1, "my_disabled_big_tile_bg_gradient_first_color"
    
    const-string v2, "my_disabled_big_tile_bg_gradient_second_color"
    
    sget v3, LMyControlCenterUtils;->myDefaultDisabledBgColor:I
    
    goto :set_gradient_colors
    
    :unavailable_gradient_colors
    const-string v1, "my_unavailable_big_tile_bg_gradient_first_color"
    
    const-string v2, "my_unavailable_big_tile_bg_gradient_second_color"
    
    sget v3, LMyControlCenterUtils;->myDefaultDisabledBgColor:I
    
    :set_gradient_colors
    invoke-static {p0, v1, v3}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I
    
    move-result v1
    
    invoke-static {p0, v2, v3}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I
    
    move-result v2
    
    const/4 v3, 0x2 # array size
    
    new-array v4, v3, [I
    
    const/4 v3, 0x0 # first element
    
    aput v1, v4, v3
    
    const/4 v3, 0x1 # second element
    
    aput v2, v4, v3
    
    invoke-virtual {v0, v4}, Landroid/graphics/drawable/GradientDrawable;->setColors([I)V
    
    :set_stroke_strings
    const/4 v1, 0x2
    
    if-ne v1, p1, :disabled_or_unavailable_stroke
    
    const-string v1, "my_active_big_tile_stroke_width"
    
    const-string v2, "my_active_big_tile_stroke_color"
    
    goto :set_stroke_and_radius
    
    :disabled_or_unavailable_stroke
    if-eqz p1, :unavailable_stroke
    
    const-string v1, "my_disabled_big_tile_stroke_width"
    
    const-string v2, "my_disabled_big_tile_stroke_color"
    
    goto :set_stroke_and_radius
    
    :unavailable_stroke
    const-string v1, "my_unavailable_big_tile_stroke_width"
    
    const-string v2, "my_unavailable_big_tile_stroke_color"
    
    :set_stroke_and_radius
    const/4 v3, 0x0
    
    invoke-static {p0, v1, v3}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I
    
    move-result v1
    
    invoke-static {p0, v2, v3}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I
    
    move-result v2
    
    invoke-virtual {v0, v1, v2}, Landroid/graphics/drawable/GradientDrawable;->setStroke(II)V
    
    const-string v1, "my_big_tile_corner_radius"
    
    sget v3, LMyControlCenterUtils;->myDefaultCornerRadius:F
    
    invoke-static {p0, v1, v3}, Landroid/provider/Settings$System;->getFloat(Landroid/content/ContentResolver;Ljava/lang/String;F)F
    
    move-result v1

    invoke-virtual {v0, v1}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V
    
    return-object v0
.end method

.method public static getGradientOrientationForBigTile(I)Landroid/graphics/drawable/GradientDrawable$Orientation;
    .param p0 # state
    .locals 1
    
    const/4 v0, 0x2
    
    if-ne v0, p0, :inactive_or_unavailable
    
    const-string v0, "my_active_big_tile_gradient_orientation"
    
    goto :get_orientation
    
    :inactive_or_unavailable
    if-eqz p0, :unavailable
    
    const-string v0, "my_disabled_big_tile_gradient_orientation"
    
    goto :get_orientation
    
    :unavailable
    const-string v0, "my_unavailable_big_tile_gradient_orientation"
    
    :get_orientation
    sget-object p0, LMyControlCenterUtils;->mCR:Landroid/content/ContentResolver;
    
    invoke-static {p0, v0}, Landroid/provider/Settings$System;->getString(Landroid/content/ContentResolver;Ljava/lang/String;)Ljava/lang/String;
    
    move-result-object v0
    
    if-nez v0, :get_value_of
    
    sget-object v0, LMyControlCenterUtils;->myDefaultGradientOrientation:Ljava/lang/String;
    
    :get_value_of
    invoke-static {v0}, Landroid/graphics/drawable/GradientDrawable$Orientation;->valueOf(Ljava/lang/String;)Landroid/graphics/drawable/GradientDrawable$Orientation;
    
    move-result-object v0
    
    return-object v0
.end method

.method public static getCustomBgDrawableFromStateForStandardTile(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;
    .param p0 # context
    .param p1 # state
    .locals 5
    
    invoke-static {p0}, LMyControlCenterUtils;->setCR(Landroid/content/Context;)V
    
    sget-object p0, LMyControlCenterUtils;->mCR:Landroid/content/ContentResolver;
    
    new-instance v0, Landroid/graphics/drawable/GradientDrawable;

    invoke-direct {v0}, Landroid/graphics/drawable/GradientDrawable;-><init>()V
    
    const-string v1, "my_standard_tile_bg_gradient_enabled"
    
    const/4 v2, 0x0
    
    invoke-static {p0, v1, v2}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I
    
    move-result v1
    
    if-nez v1, :gradient_enabled
    
    const/4 v1, 0x2
    
    if-ne v1, p1, :disabled_or_unavailable_single_color
    
    const-string v1, "my_active_standard_tile_bg_color"
    
    sget v2, LMyControlCenterUtils;->myDefaultActiveBgColor:I
    
    goto :set_single_color
    
    :disabled_or_unavailable_single_color
    if-eqz p1, :unavailable_single_color
    
    const-string v1, "my_disabled_standard_tile_bg_color"
    
    sget v2, LMyControlCenterUtils;->myDefaultDisabledBgColor:I
    
    goto :set_single_color
    
    :unavailable_single_color
    const-string v1, "my_unavailable_standard_tile_bg_color"
    
    sget v2, LMyControlCenterUtils;->myDefaultDisabledBgColor:I
    
    :set_single_color
    invoke-static {p0, v1, v2}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I
    
    move-result v1

    invoke-virtual {v0, v1}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V
    
    goto :set_stroke_strings
    
    :gradient_enabled
    invoke-virtual {v0, v2}, Landroid/graphics/drawable/GradientDrawable;->setGradientType(I)V # 0x0 = LINEAR_GRADIENT
    
    invoke-static {p1}, LMyControlCenterUtils;->getGradientOrientationForStandardTile(I)Landroid/graphics/drawable/GradientDrawable$Orientation;
    
    move-result-object v1
    
    invoke-virtual {v0, v1}, Landroid/graphics/drawable/GradientDrawable;->setOrientation(Landroid/graphics/drawable/GradientDrawable$Orientation;)V
    
    const/4 v1, 0x2
    
    if-ne v1, p1, :disabled_or_unavailable_gradient_colors
    
    const-string v1, "my_active_standard_tile_bg_gradient_first_color"
    
    const-string v2, "my_active_standard_tile_bg_gradient_second_color"
    
    sget v3, LMyControlCenterUtils;->myDefaultActiveBgColor:I
    
    goto :set_gradient_colors
    
    :disabled_or_unavailable_gradient_colors
    if-eqz p1, :unavailable_gradient_colors
    
    const-string v1, "my_disabled_standard_tile_bg_gradient_first_color"
    
    const-string v2, "my_disabled_standard_tile_bg_gradient_second_color"
    
    sget v3, LMyControlCenterUtils;->myDefaultDisabledBgColor:I
    
    goto :set_gradient_colors
    
    :unavailable_gradient_colors
    const-string v1, "my_unavailable_standard_tile_bg_gradient_first_color"
    
    const-string v2, "my_unavailable_standard_tile_bg_gradient_second_color"
    
    sget v3, LMyControlCenterUtils;->myDefaultDisabledBgColor:I
    
    :set_gradient_colors
    invoke-static {p0, v1, v3}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I
    
    move-result v1
    
    invoke-static {p0, v2, v3}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I
    
    move-result v2
    
    const/4 v3, 0x2 # array size
    
    new-array v4, v3, [I
    
    const/4 v3, 0x0 # first element
    
    aput v1, v4, v3
    
    const/4 v3, 0x1 # second element
    
    aput v2, v4, v3
    
    invoke-virtual {v0, v4}, Landroid/graphics/drawable/GradientDrawable;->setColors([I)V
    
    :set_stroke_strings
    const/4 v1, 0x2
    
    if-ne v1, p1, :disabled_or_unavailable_stroke
    
    const-string v1, "my_active_standard_tile_stroke_width"
    
    const-string v2, "my_active_standard_tile_stroke_color"
    
    goto :set_stroke_and_radius
    
    :disabled_or_unavailable_stroke
    if-eqz p1, :unavailable_stroke
    
    const-string v1, "my_disabled_standard_tile_stroke_width"
    
    const-string v2, "my_disabled_standard_tile_stroke_color"
    
    goto :set_stroke_and_radius
    
    :unavailable_stroke
    const-string v1, "my_unavailable_standard_tile_stroke_width"
    
    const-string v2, "my_unavailable_standard_tile_stroke_color"
    
    :set_stroke_and_radius
    const/4 v3, 0x0
    
    invoke-static {p0, v1, v3}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I
    
    move-result v1
    
    invoke-static {p0, v2, v3}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I
    
    move-result v2
    
    invoke-virtual {v0, v1, v2}, Landroid/graphics/drawable/GradientDrawable;->setStroke(II)V
    
    const-string v1, "my_standard_tile_corner_radius"
    
    sget v3, LMyControlCenterUtils;->myDefaultCornerRadius:F
    
    invoke-static {p0, v1, v3}, Landroid/provider/Settings$System;->getFloat(Landroid/content/ContentResolver;Ljava/lang/String;F)F
    
    move-result v1

    invoke-virtual {v0, v1}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V
    
    return-object v0
.end method

.method public static getGradientOrientationForStandardTile(I)Landroid/graphics/drawable/GradientDrawable$Orientation;
    .param p0 # state
    .locals 1
    
    const/4 v0, 0x2
    
    if-ne v0, p0, :disabled_or_unavailable
    
    const-string v0, "my_active_standard_tile_gradient_orientation"
    
    goto :get_orientation
    
    :disabled_or_unavailable
    if-eqz p0, :unavailable
    
    const-string v0, "my_disabled_standard_tile_gradient_orientation"
    
    goto :get_orientation
    
    :unavailable
    const-string v0, "my_unavailable_standard_tile_gradient_orientation"
    
    :get_orientation
    sget-object p0, LMyControlCenterUtils;->mCR:Landroid/content/ContentResolver;
    
    invoke-static {p0, v0}, Landroid/provider/Settings$System;->getString(Landroid/content/ContentResolver;Ljava/lang/String;)Ljava/lang/String;
    
    move-result-object v0
    
    if-nez v0, :get_value_of
    
    sget-object v0, LMyControlCenterUtils;->myDefaultGradientOrientation:Ljava/lang/String;
    
    :get_value_of
    invoke-static {v0}, Landroid/graphics/drawable/GradientDrawable$Orientation;->valueOf(Ljava/lang/String;)Landroid/graphics/drawable/GradientDrawable$Orientation;
    
    move-result-object v0
    
    return-object v0
.end method

.method public static getCustomDrawableForSliderBackground(Landroid/content/Context;)Landroid/graphics/drawable/Drawable;
    .param p0 # context
    .locals 5
    
    invoke-static {p0}, LMyControlCenterUtils;->setCR(Landroid/content/Context;)V
    
    sget-object p0, LMyControlCenterUtils;->mCR:Landroid/content/ContentResolver;
    
    new-instance v0, Landroid/graphics/drawable/GradientDrawable;

    invoke-direct {v0}, Landroid/graphics/drawable/GradientDrawable;-><init>()V
    
    const-string v1, "my_slider_gradient_enabled"
    
    const/4 v2, 0x0
    
    invoke-static {p0, v1, v2}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I
    
    move-result v1
    
    if-nez v1, :gradient_enabled
    
    const-string v1, "my_slider_bg_color"
    
    sget v2, LMyControlCenterUtils;->myDefaultDisabledBgColor:I
    
    invoke-static {p0, v1, v2}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I
    
    move-result v1

    invoke-virtual {v0, v1}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V
    
    goto :set_stroke_strings
    
    :gradient_enabled
    invoke-virtual {v0, v2}, Landroid/graphics/drawable/GradientDrawable;->setGradientType(I)V # 0x0 = LINEAR_GRADIENT
    
    invoke-static {}, LMyControlCenterUtils;->getGradientOrientationForSliderBackground()Landroid/graphics/drawable/GradientDrawable$Orientation;
    
    move-result-object v1
    
    invoke-virtual {v0, v1}, Landroid/graphics/drawable/GradientDrawable;->setOrientation(Landroid/graphics/drawable/GradientDrawable$Orientation;)V
    
    const-string v1, "my_slider_bg_gradient_first_color"
    
    const-string v2, "my_slider_bg_gradient_second_color"
    
    sget v3, LMyControlCenterUtils;->myDefaultActiveBgColor:I
    
    invoke-static {p0, v1, v3}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I
    
    move-result v1
    
    invoke-static {p0, v2, v3}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I
    
    move-result v2
    
    const/4 v3, 0x2 # array size
    
    new-array v4, v3, [I
    
    const/4 v3, 0x0 # first element
    
    aput v1, v4, v3
    
    const/4 v3, 0x1 # second element
    
    aput v2, v4, v3
    
    invoke-virtual {v0, v4}, Landroid/graphics/drawable/GradientDrawable;->setColors([I)V
    
    :set_stroke_strings
    
    # i can't imagine anyone using different stroke and corner radii settings for slider bg and fg
    const-string v1, "my_slider_stroke_width"
    
    const-string v2, "my_slider_stroke_color"
    
    const/4 v3, 0x0
    
    invoke-static {p0, v1, v3}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I
    
    move-result v1
    
    invoke-static {p0, v2, v3}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I
    
    move-result v2
    
    invoke-virtual {v0, v1, v2}, Landroid/graphics/drawable/GradientDrawable;->setStroke(II)V
    
    const-string v1, "my_slider_corner_radius"
    
    sget v3, LMyControlCenterUtils;->myDefaultCornerRadius:F
    
    invoke-static {p0, v1, v3}, Landroid/provider/Settings$System;->getFloat(Landroid/content/ContentResolver;Ljava/lang/String;F)F
    
    move-result v1

    invoke-virtual {v0, v1}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V
    
    return-object v0
.end method

.method private static getGradientOrientationForSliderBackground()Landroid/graphics/drawable/GradientDrawable$Orientation;
    .locals 2
    
    sget-object v0, LMyControlCenterUtils;->mCR:Landroid/content/ContentResolver;
    
    const-string v1, "my_slider_bg_gradient_orientation"
    
    invoke-static {v0, v1}, Landroid/provider/Settings$System;->getString(Landroid/content/ContentResolver;Ljava/lang/String;)Ljava/lang/String;
    
    move-result-object v0
    
    if-nez v0, :get_value_of
    
    sget-object v0, LMyControlCenterUtils;->myDefaultGradientOrientation:Ljava/lang/String;
    
    :get_value_of
    invoke-static {v0}, Landroid/graphics/drawable/GradientDrawable$Orientation;->valueOf(Ljava/lang/String;)Landroid/graphics/drawable/GradientDrawable$Orientation;
    
    move-result-object v0
    
    return-object v0
.end method

.method public static getCustomDrawableForSliderForeground(Landroid/content/Context;)Landroid/graphics/drawable/Drawable;
    .param p0 # context
    .locals 5
    
    invoke-static {p0}, LMyControlCenterUtils;->setCR(Landroid/content/Context;)V
    
    sget-object p0, LMyControlCenterUtils;->mCR:Landroid/content/ContentResolver;
    
    new-instance v0, Landroid/graphics/drawable/GradientDrawable;

    invoke-direct {v0}, Landroid/graphics/drawable/GradientDrawable;-><init>()V
    
    const-string v1, "my_slider_gradient_enabled"
    
    const/4 v2, 0x0
    
    invoke-static {p0, v1, v2}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I
    
    move-result v1
    
    if-nez v1, :gradient_enabled
    
    const-string v1, "my_slider_fg_color"
    
    sget v2, LMyControlCenterUtils;->myDefaultSliderForegroundColor:I
    
    invoke-static {p0, v1, v2}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I
    
    move-result v1

    invoke-virtual {v0, v1}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V
    
    goto :set_stroke_strings
    
    :gradient_enabled
    invoke-virtual {v0, v2}, Landroid/graphics/drawable/GradientDrawable;->setGradientType(I)V # 0x0 = LINEAR_GRADIENT
    
    invoke-static {}, LMyControlCenterUtils;->getGradientOrientationForSliderForeground()Landroid/graphics/drawable/GradientDrawable$Orientation;
    
    move-result-object v1
    
    invoke-virtual {v0, v1}, Landroid/graphics/drawable/GradientDrawable;->setOrientation(Landroid/graphics/drawable/GradientDrawable$Orientation;)V
    
    const-string v1, "my_slider_fg_gradient_first_color"
    
    const-string v2, "my_slider_fg_gradient_second_color"
    
    sget v3, LMyControlCenterUtils;->myDefaultSliderForegroundColor:I
    
    invoke-static {p0, v1, v3}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I
    
    move-result v1
    
    invoke-static {p0, v2, v3}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I
    
    move-result v2
    
    const/4 v3, 0x2 # array size
    
    new-array v4, v3, [I
    
    const/4 v3, 0x0 # first element
    
    aput v1, v4, v3
    
    const/4 v3, 0x1 # second element
    
    aput v2, v4, v3
    
    invoke-virtual {v0, v4}, Landroid/graphics/drawable/GradientDrawable;->setColors([I)V
    
    :set_stroke_strings
    
    # i can't imagine anyone using different stroke and corner radii settings for slider bg and fg
    const-string v1, "my_slider_stroke_width"
    
    const-string v2, "my_slider_stroke_color"
    
    const/4 v3, 0x0
    
    invoke-static {p0, v1, v3}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I
    
    move-result v1
    
    invoke-static {p0, v2, v3}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I
    
    move-result v2
    
    invoke-virtual {v0, v1, v2}, Landroid/graphics/drawable/GradientDrawable;->setStroke(II)V
    
    const-string v1, "my_slider_corner_radius"
    
    sget v3, LMyControlCenterUtils;->myDefaultCornerRadius:F
    
    invoke-static {p0, v1, v3}, Landroid/provider/Settings$System;->getFloat(Landroid/content/ContentResolver;Ljava/lang/String;F)F
    
    move-result v1

    invoke-virtual {v0, v1}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V
    
    return-object v0
.end method

.method private static getGradientOrientationForSliderForeground()Landroid/graphics/drawable/GradientDrawable$Orientation;
    .locals 2
    
    sget-object v0, LMyControlCenterUtils;->mCR:Landroid/content/ContentResolver;
    
    const-string v1, "my_slider_fg_gradient_orientation"
    
    invoke-static {v0, v1}, Landroid/provider/Settings$System;->getString(Landroid/content/ContentResolver;Ljava/lang/String;)Ljava/lang/String;
    
    move-result-object v0
    
    if-nez v0, :get_value_of
    
    sget-object v0, LMyControlCenterUtils;->myDefaultGradientOrientation:Ljava/lang/String;
    
    :get_value_of
    invoke-static {v0}, Landroid/graphics/drawable/GradientDrawable$Orientation;->valueOf(Ljava/lang/String;)Landroid/graphics/drawable/GradientDrawable$Orientation;
    
    move-result-object v0
    
    return-object v0
.end method

.method public static getCustomSliderIconColor(Landroid/content/Context;)I
    .locals 3
    
    invoke-static {p0}, LMyControlCenterUtils;->setCR(Landroid/content/Context;)V
    
    sget-object v0, LMyControlCenterUtils;->mCR:Landroid/content/ContentResolver;
    
    const-string v1, "my_slider_icon_color"
    
    sget v2, LMyControlCenterUtils;->myDefaultSliderIconColor:I
    
    invoke-static {v0, v1, v2}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I
    
    move-result v2
    
    return v2
.end method
