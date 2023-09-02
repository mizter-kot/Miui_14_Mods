.class public Lcom/android/settings/MyStandardTilesDesignCustomSettings;
.super Lcom/android/settings/MiuiSettingsPreferenceFragment;
.source "MyStandardTilesDesignCustomSettings.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 14
    invoke-direct {p0}, Lcom/android/settings/MiuiSettingsPreferenceFragment;-><init>()V

    return-void
.end method


# virtual methods
.method public getIDinternalXml(Ljava/lang/String;)I
    .locals 3
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    invoke-virtual {p0}, Lcom/android/settings/MyStandardTilesDesignCustomSettings;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const-string v1, "xml"

    const-string v2, "com.android.settings"

    invoke-virtual {v0, p1, v1, v2}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    return v0
.end method

.method public getName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 37
    const-class v0, Lcom/android/settings/MyStandardTilesDesignCustomSettings;

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 1

    .prologue
    invoke-super {p0, p1}, Lcom/android/settings/MiuiSettingsPreferenceFragment;->onCreate(Landroid/os/Bundle;)V

    .line 43
    const-string v0, "my_standard_tiles_design_custom_settings" # Сюда ставим имя своей xml-болванки!!!

    invoke-virtual {p0, v0}, Lcom/android/settings/MyStandardTilesDesignCustomSettings;->getIDinternalXml(Ljava/lang/String;)I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/android/settings/MyStandardTilesDesignCustomSettings;->addPreferencesFromResource(I)V

    .line 44
    return-void
.end method
