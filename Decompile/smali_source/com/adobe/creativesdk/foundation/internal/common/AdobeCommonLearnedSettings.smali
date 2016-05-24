.class public Lcom/adobe/creativesdk/foundation/internal/common/AdobeCommonLearnedSettings;
.super Ljava/lang/Object;
.source "AdobeCommonLearnedSettings.java"


# direct methods
.method private static CommitPreference(Ljava/lang/String;Ljava/lang/String;)V
    .registers 4
    .param p0, "key"    # Ljava/lang/String;
    .param p1, "value"    # Ljava/lang/String;

    .prologue
    .line 50
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/common/AdobeCommonLearnedSettings;->getCommonLearnedPreference()Landroid/content/SharedPreferences;

    move-result-object v1

    .line 51
    .local v1, "preferences":Landroid/content/SharedPreferences;
    invoke-interface {v1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    .line 52
    .local v0, "editor":Landroid/content/SharedPreferences$Editor;
    invoke-interface {v0, p0, p1}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 53
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 54
    return-void
.end method

.method private static getCommonLearnedPreference()Landroid/content/SharedPreferences;
    .registers 3

    .prologue
    .line 40
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/common/AdobeCommonLearnedSettings;->getContext()Landroid/content/Context;

    move-result-object v0

    const-string v1, "CommonLearnedSettings"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    return-object v0
.end method

.method private static getContext()Landroid/content/Context;
    .registers 1

    .prologue
    .line 36
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/common/AdobeCommonApplicationContextHolder;->getSharedApplicationContextHolder()Lcom/adobe/creativesdk/foundation/internal/common/AdobeCommonApplicationContextHolder;

    move-result-object v0

    invoke-virtual {v0}, Lcom/adobe/creativesdk/foundation/internal/common/AdobeCommonApplicationContextHolder;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    return-object v0
.end method

.method public static getFileProvideAuthority()Ljava/lang/String;
    .registers 2

    .prologue
    .line 115
    const-string v0, "shareFileProvider"

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/adobe/creativesdk/foundation/internal/common/AdobeCommonLearnedSettings;->getPreference(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private static getPreference(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .registers 3
    .param p0, "key"    # Ljava/lang/String;
    .param p1, "defaultValue"    # Ljava/lang/String;

    .prologue
    .line 45
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/common/AdobeCommonLearnedSettings;->getCommonLearnedPreference()Landroid/content/SharedPreferences;

    move-result-object v0

    invoke-interface {v0, p0, p1}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static lastCollectionSortType()Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetBrowserCommonTypes$AdobePhotoSortType;
    .registers 3

    .prologue
    .line 86
    const-string v1, "lastCollectionSortType"

    sget-object v2, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetBrowserCommonTypes$AdobePhotoSortType;->ADOBE_PHOTO_SORT_TYPE_TIME:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetBrowserCommonTypes$AdobePhotoSortType;

    invoke-virtual {v2}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetBrowserCommonTypes$AdobePhotoSortType;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/adobe/creativesdk/foundation/internal/common/AdobeCommonLearnedSettings;->getPreference(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 87
    .local v0, "sortStr":Ljava/lang/String;
    invoke-static {v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetBrowserCommonTypes$AdobePhotoSortType;->valueOf(Ljava/lang/String;)Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetBrowserCommonTypes$AdobePhotoSortType;

    move-result-object v1

    return-object v1
.end method

.method public static lastSortState()Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetBrowserCommonTypes$AdobeUXAssetBrowserSortState;
    .registers 3

    .prologue
    .line 100
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/common/AdobeCommonLearnedSettings;->lastSortType()Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetBrowserCommonTypes$AdobeUXAssetBrowserSortType;

    move-result-object v1

    sget-object v2, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetBrowserCommonTypes$AdobeUXAssetBrowserSortType;->SORT_TYPE_TIME:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetBrowserCommonTypes$AdobeUXAssetBrowserSortType;

    if-ne v1, v2, :cond_19

    .line 101
    const-string v1, "lastSortState"

    sget-object v2, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetBrowserCommonTypes$AdobeUXAssetBrowserSortState;->SORT_STATE_DESCENDING:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetBrowserCommonTypes$AdobeUXAssetBrowserSortState;

    invoke-virtual {v2}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetBrowserCommonTypes$AdobeUXAssetBrowserSortState;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/adobe/creativesdk/foundation/internal/common/AdobeCommonLearnedSettings;->getPreference(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 105
    .local v0, "sortStateStr":Ljava/lang/String;
    :goto_14
    invoke-static {v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetBrowserCommonTypes$AdobeUXAssetBrowserSortState;->valueOf(Ljava/lang/String;)Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetBrowserCommonTypes$AdobeUXAssetBrowserSortState;

    move-result-object v1

    return-object v1

    .line 103
    .end local v0    # "sortStateStr":Ljava/lang/String;
    :cond_19
    const-string v1, "lastSortState"

    sget-object v2, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetBrowserCommonTypes$AdobeUXAssetBrowserSortState;->SORT_STATE_ASCENDING:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetBrowserCommonTypes$AdobeUXAssetBrowserSortState;

    invoke-virtual {v2}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetBrowserCommonTypes$AdobeUXAssetBrowserSortState;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/adobe/creativesdk/foundation/internal/common/AdobeCommonLearnedSettings;->getPreference(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .restart local v0    # "sortStateStr":Ljava/lang/String;
    goto :goto_14
.end method

.method public static lastSortType()Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetBrowserCommonTypes$AdobeUXAssetBrowserSortType;
    .registers 3

    .prologue
    .line 75
    const-string v1, "lastSortType"

    sget-object v2, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetBrowserCommonTypes$AdobeUXAssetBrowserSortType;->SORT_TYPE_TIME:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetBrowserCommonTypes$AdobeUXAssetBrowserSortType;

    invoke-virtual {v2}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetBrowserCommonTypes$AdobeUXAssetBrowserSortType;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/adobe/creativesdk/foundation/internal/common/AdobeCommonLearnedSettings;->getPreference(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 76
    .local v0, "sortStr":Ljava/lang/String;
    invoke-static {v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetBrowserCommonTypes$AdobeUXAssetBrowserSortType;->valueOf(Ljava/lang/String;)Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetBrowserCommonTypes$AdobeUXAssetBrowserSortType;

    move-result-object v1

    return-object v1
.end method

.method public static lastSortTypeSetByUser()Z
    .registers 3

    .prologue
    .line 120
    const-string v1, "lastSortType"

    const/4 v2, 0x0

    invoke-static {v1, v2}, Lcom/adobe/creativesdk/foundation/internal/common/AdobeCommonLearnedSettings;->getPreference(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 121
    .local v0, "sortStr":Ljava/lang/String;
    if-eqz v0, :cond_b

    const/4 v1, 0x1

    :goto_a
    return v1

    :cond_b
    const/4 v1, 0x0

    goto :goto_a
.end method

.method public static lastVisualLayout()Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetBrowserCommonTypes$AdobeUXAssetBrowserVisualLayout;
    .registers 3

    .prologue
    .line 63
    const-string v1, "VisualLayout"

    sget-object v2, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetBrowserCommonTypes$AdobeUXAssetBrowserVisualLayout;->ADOBE_STORAGE_VISUAL_LAYOUT_WATERFALL:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetBrowserCommonTypes$AdobeUXAssetBrowserVisualLayout;

    invoke-virtual {v2}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetBrowserCommonTypes$AdobeUXAssetBrowserVisualLayout;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/adobe/creativesdk/foundation/internal/common/AdobeCommonLearnedSettings;->getPreference(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 64
    .local v0, "layoutStr":Ljava/lang/String;
    invoke-static {v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetBrowserCommonTypes$AdobeUXAssetBrowserVisualLayout;->valueOf(Ljava/lang/String;)Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetBrowserCommonTypes$AdobeUXAssetBrowserVisualLayout;

    move-result-object v1

    return-object v1
.end method

.method public static lastVisualSetByUser()Z
    .registers 3

    .prologue
    .line 126
    const-string v1, "VisualLayout"

    const/4 v2, 0x0

    invoke-static {v1, v2}, Lcom/adobe/creativesdk/foundation/internal/common/AdobeCommonLearnedSettings;->getPreference(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 127
    .local v0, "visualLayout":Ljava/lang/String;
    if-eqz v0, :cond_b

    const/4 v1, 0x1

    :goto_a
    return v1

    :cond_b
    const/4 v1, 0x0

    goto :goto_a
.end method

.method public static setLastSortState(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetBrowserCommonTypes$AdobeUXAssetBrowserSortState;)V
    .registers 3
    .param p0, "sortState"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetBrowserCommonTypes$AdobeUXAssetBrowserSortState;

    .prologue
    .line 81
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetBrowserCommonTypes$AdobeUXAssetBrowserSortState;->toString()Ljava/lang/String;

    move-result-object v0

    .line 82
    .local v0, "sortStateStr":Ljava/lang/String;
    const-string v1, "lastSortState"

    invoke-static {v1, v0}, Lcom/adobe/creativesdk/foundation/internal/common/AdobeCommonLearnedSettings;->CommitPreference(Ljava/lang/String;Ljava/lang/String;)V

    .line 83
    return-void
.end method

.method public static setLastSortType(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetBrowserCommonTypes$AdobeUXAssetBrowserSortType;)V
    .registers 3
    .param p0, "sortType"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetBrowserCommonTypes$AdobeUXAssetBrowserSortType;

    .prologue
    .line 69
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetBrowserCommonTypes$AdobeUXAssetBrowserSortType;->toString()Ljava/lang/String;

    move-result-object v0

    .line 70
    .local v0, "sortTypeStr":Ljava/lang/String;
    const-string v1, "lastSortType"

    invoke-static {v1, v0}, Lcom/adobe/creativesdk/foundation/internal/common/AdobeCommonLearnedSettings;->CommitPreference(Ljava/lang/String;Ljava/lang/String;)V

    .line 71
    return-void
.end method

.method public static setLastVisualLayout(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetBrowserCommonTypes$AdobeUXAssetBrowserVisualLayout;)V
    .registers 3
    .param p0, "visuallayout"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetBrowserCommonTypes$AdobeUXAssetBrowserVisualLayout;

    .prologue
    .line 57
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetBrowserCommonTypes$AdobeUXAssetBrowserVisualLayout;->toString()Ljava/lang/String;

    move-result-object v0

    .line 58
    .local v0, "visualStr":Ljava/lang/String;
    const-string v1, "VisualLayout"

    invoke-static {v1, v0}, Lcom/adobe/creativesdk/foundation/internal/common/AdobeCommonLearnedSettings;->CommitPreference(Ljava/lang/String;Ljava/lang/String;)V

    .line 59
    return-void
.end method
