.class public Lcom/adobe/creativesdk/aviary/utils/SharedPreferencesUtils;
.super Ljava/lang/Object;
.source "SharedPreferencesUtils.java"


# static fields
.field public static final DEFAULT_SIZE_STR:Ljava/lang/String;

.field static volatile sInstance:Lcom/adobe/creativesdk/aviary/utils/SharedPreferencesUtils;


# instance fields
.field private final preferences:Landroid/content/SharedPreferences;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 72
    sget-object v0, Lcom/adobe/creativesdk/aviary/internal/InternalConstants;->DEFAULT_SIZE:Lcom/adobe/creativesdk/aviary/internal/headless/utils/MegaPixels;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/aviary/internal/headless/utils/MegaPixels;->ordinal()I

    move-result v0

    invoke-static {v0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/adobe/creativesdk/aviary/utils/SharedPreferencesUtils;->DEFAULT_SIZE_STR:Ljava/lang/String;

    return-void
.end method

.method constructor <init>(Landroid/content/Context;)V
    .registers 4
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 81
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 82
    const-string v0, "com.aviary.android.feather.standalone"

    const/4 v1, 0x4

    invoke-virtual {p1, v0, v1}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/utils/SharedPreferencesUtils;->preferences:Landroid/content/SharedPreferences;

    .line 83
    return-void
.end method

.method public static getInstance(Landroid/content/Context;)Lcom/adobe/creativesdk/aviary/utils/SharedPreferencesUtils;
    .registers 6
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 373
    sget-object v0, Lcom/adobe/creativesdk/aviary/utils/SharedPreferencesUtils;->sInstance:Lcom/adobe/creativesdk/aviary/utils/SharedPreferencesUtils;

    .line 374
    .local v0, "field":Lcom/adobe/creativesdk/aviary/utils/SharedPreferencesUtils;
    if-nez v0, :cond_1b

    .line 375
    const-class v3, Lcom/adobe/creativesdk/aviary/utils/SharedPreferencesUtils;

    monitor-enter v3

    .line 376
    :try_start_7
    sget-object v0, Lcom/adobe/creativesdk/aviary/utils/SharedPreferencesUtils;->sInstance:Lcom/adobe/creativesdk/aviary/utils/SharedPreferencesUtils;

    .line 377
    if-nez v0, :cond_1a

    .line 378
    new-instance v1, Lcom/adobe/creativesdk/aviary/utils/SharedPreferencesUtils;

    invoke-direct {v1, p0}, Lcom/adobe/creativesdk/aviary/utils/SharedPreferencesUtils;-><init>(Landroid/content/Context;)V

    sput-object v1, Lcom/adobe/creativesdk/aviary/utils/SharedPreferencesUtils;->sInstance:Lcom/adobe/creativesdk/aviary/utils/SharedPreferencesUtils;
    :try_end_12
    .catchall {:try_start_7 .. :try_end_12} :catchall_1c

    .line 379
    .end local v0    # "field":Lcom/adobe/creativesdk/aviary/utils/SharedPreferencesUtils;
    .local v1, "field":Lcom/adobe/creativesdk/aviary/utils/SharedPreferencesUtils;
    :try_start_12
    const-string v2, "SharedPreferencesUtils"

    const-string v4, "new SharedPreferencesUtils"

    invoke-static {v2, v4}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_19
    .catchall {:try_start_12 .. :try_end_19} :catchall_1f

    move-object v0, v1

    .line 381
    .end local v1    # "field":Lcom/adobe/creativesdk/aviary/utils/SharedPreferencesUtils;
    .restart local v0    # "field":Lcom/adobe/creativesdk/aviary/utils/SharedPreferencesUtils;
    :cond_1a
    :try_start_1a
    monitor-exit v3

    .line 383
    :cond_1b
    return-object v0

    .line 381
    :catchall_1c
    move-exception v2

    :goto_1d
    monitor-exit v3
    :try_end_1e
    .catchall {:try_start_1a .. :try_end_1e} :catchall_1c

    throw v2

    .end local v0    # "field":Lcom/adobe/creativesdk/aviary/utils/SharedPreferencesUtils;
    .restart local v1    # "field":Lcom/adobe/creativesdk/aviary/utils/SharedPreferencesUtils;
    :catchall_1f
    move-exception v2

    move-object v0, v1

    .end local v1    # "field":Lcom/adobe/creativesdk/aviary/utils/SharedPreferencesUtils;
    .restart local v0    # "field":Lcom/adobe/creativesdk/aviary/utils/SharedPreferencesUtils;
    goto :goto_1d
.end method


# virtual methods
.method public containsSingleTimeKey(Ljava/lang/String;)Z
    .registers 3
    .param p1, "key"    # Ljava/lang/String;

    .prologue
    .line 93
    const/4 v0, 0x1

    invoke-virtual {p0, p1, v0}, Lcom/adobe/creativesdk/aviary/utils/SharedPreferencesUtils;->containsSingleTimeKey(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public containsSingleTimeKey(Ljava/lang/String;Z)Z
    .registers 5
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "writeIfNotFound"    # Z

    .prologue
    .line 102
    invoke-virtual {p0, p1}, Lcom/adobe/creativesdk/aviary/utils/SharedPreferencesUtils;->hasKey(Ljava/lang/String;)Z

    move-result v0

    .line 103
    .local v0, "result":Z
    if-nez v0, :cond_c

    if-eqz p2, :cond_c

    .line 104
    const/4 v1, 0x1

    invoke-virtual {p0, p1, v1}, Lcom/adobe/creativesdk/aviary/utils/SharedPreferencesUtils;->putBoolean(Ljava/lang/String;Z)V

    .line 106
    :cond_c
    return v0
.end method

.method public final getBoolean(Ljava/lang/String;Z)Z
    .registers 4
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "defaultValue"    # Z

    .prologue
    .line 332
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/utils/SharedPreferencesUtils;->preferences:Landroid/content/SharedPreferences;

    invoke-interface {v0, p1, p2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public getCdsContentGroup()Ljava/lang/String;
    .registers 3

    .prologue
    .line 275
    const-string v0, "aviary.cds.content-group-name"

    const-string v1, "A"

    invoke-virtual {p0, v0, v1}, Lcom/adobe/creativesdk/aviary/utils/SharedPreferencesUtils;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getCdsContentGroupUpdateTime()J
    .registers 5

    .prologue
    .line 283
    const-string v0, "aviary.cds.content-group-update-time"

    const-wide/16 v2, 0x0

    invoke-virtual {p0, v0, v2, v3}, Lcom/adobe/creativesdk/aviary/utils/SharedPreferencesUtils;->getLong(Ljava/lang/String;J)J

    move-result-wide v0

    return-wide v0
.end method

.method public getCdsLastExecutionTime()J
    .registers 5

    .prologue
    .line 296
    const-string v0, "aviary.cds.last-execution-time"

    const-wide/16 v2, 0x0

    invoke-virtual {p0, v0, v2, v3}, Lcom/adobe/creativesdk/aviary/utils/SharedPreferencesUtils;->getLong(Ljava/lang/String;J)J

    move-result-wide v0

    return-wide v0
.end method

.method public getDisabledTools()[Ljava/lang/String;
    .registers 5

    .prologue
    .line 180
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/utils/SharedPreferencesUtils;->preferences:Landroid/content/SharedPreferences;

    const-string v2, "12.aviary.disabled.tools"

    const-string v3, ""

    invoke-interface {v1, v2, v3}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 181
    .local v0, "str":Ljava/lang/String;
    const-string v1, ","

    invoke-virtual {v0, v1}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public final getInt(Ljava/lang/String;I)I
    .registers 4
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "defaultValue"    # I

    .prologue
    .line 340
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/utils/SharedPreferencesUtils;->preferences:Landroid/content/SharedPreferences;

    invoke-interface {v0, p1, p2}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v0

    return v0
.end method

.method public final getLong(Ljava/lang/String;J)J
    .registers 6
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "defaultValue"    # J

    .prologue
    .line 328
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/utils/SharedPreferencesUtils;->preferences:Landroid/content/SharedPreferences;

    invoke-interface {v0, p1, p2, p3}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide v0

    return-wide v0
.end method

.method public getOrderedTools()[Ljava/lang/String;
    .registers 5

    .prologue
    .line 169
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/utils/SharedPreferencesUtils;->preferences:Landroid/content/SharedPreferences;

    const-string v2, "12.aviary.ordered.tools"

    const-string v3, ""

    invoke-interface {v1, v2, v3}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 170
    .local v0, "string":Ljava/lang/String;
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_15

    .line 171
    invoke-static {}, Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory;->getAllTools()[Ljava/lang/String;

    move-result-object v1

    .line 173
    :goto_14
    return-object v1

    :cond_15
    const-string v1, ","

    invoke-virtual {v0, v1}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v1

    goto :goto_14
.end method

.method public final getOutputImageQuality()I
    .registers 3

    .prologue
    .line 194
    const-string v0, "aviary.output.image.quality"

    const/16 v1, 0x61

    invoke-virtual {p0, v0, v1}, Lcom/adobe/creativesdk/aviary/utils/SharedPreferencesUtils;->getInt(Ljava/lang/String;I)I

    move-result v0

    return v0
.end method

.method public getOutputImageSize()Lcom/adobe/creativesdk/aviary/internal/headless/utils/MegaPixels;
    .registers 8

    .prologue
    .line 201
    const-string v4, "aviary.output.image.size.2"

    invoke-virtual {p0, v4}, Lcom/adobe/creativesdk/aviary/utils/SharedPreferencesUtils;->hasKey(Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_b

    .line 202
    sget-object v1, Lcom/adobe/creativesdk/aviary/internal/InternalConstants;->DEFAULT_SIZE:Lcom/adobe/creativesdk/aviary/internal/headless/utils/MegaPixels;

    .line 226
    :cond_a
    :goto_a
    return-object v1

    .line 205
    :cond_b
    iget-object v4, p0, Lcom/adobe/creativesdk/aviary/utils/SharedPreferencesUtils;->preferences:Landroid/content/SharedPreferences;

    const-string v5, "aviary.output.image.size.2"

    sget-object v6, Lcom/adobe/creativesdk/aviary/utils/SharedPreferencesUtils;->DEFAULT_SIZE_STR:Ljava/lang/String;

    invoke-interface {v4, v5, v6}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 206
    .local v3, "value":Ljava/lang/String;
    const/4 v0, 0x0

    .line 208
    .local v0, "intValue":I
    :try_start_16
    invoke-static {v3}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I
    :try_end_19
    .catch Ljava/lang/Throwable; {:try_start_16 .. :try_end_19} :catch_31

    move-result v0

    .line 213
    :goto_1a
    sget-object v1, Lcom/adobe/creativesdk/aviary/internal/InternalConstants;->DEFAULT_SIZE:Lcom/adobe/creativesdk/aviary/internal/headless/utils/MegaPixels;

    .line 215
    .local v1, "megapixel":Lcom/adobe/creativesdk/aviary/internal/headless/utils/MegaPixels;
    :try_start_1c
    invoke-static {}, Lcom/adobe/creativesdk/aviary/internal/headless/utils/MegaPixels;->values()[Lcom/adobe/creativesdk/aviary/internal/headless/utils/MegaPixels;

    move-result-object v4

    aget-object v1, v4, v0
    :try_end_22
    .catch Ljava/lang/Throwable; {:try_start_1c .. :try_end_22} :catch_36

    .line 220
    :goto_22
    invoke-virtual {v1}, Lcom/adobe/creativesdk/aviary/internal/headless/utils/MegaPixels;->ordinal()I

    move-result v4

    sget-object v5, Lcom/adobe/creativesdk/aviary/internal/InternalConstants;->NORMAL_SIZE:Lcom/adobe/creativesdk/aviary/internal/headless/utils/MegaPixels;

    invoke-virtual {v5}, Lcom/adobe/creativesdk/aviary/internal/headless/utils/MegaPixels;->ordinal()I

    move-result v5

    if-ge v4, v5, :cond_3b

    .line 221
    sget-object v1, Lcom/adobe/creativesdk/aviary/internal/InternalConstants;->NORMAL_SIZE:Lcom/adobe/creativesdk/aviary/internal/headless/utils/MegaPixels;

    goto :goto_a

    .line 209
    .end local v1    # "megapixel":Lcom/adobe/creativesdk/aviary/internal/headless/utils/MegaPixels;
    :catch_31
    move-exception v2

    .line 210
    .local v2, "t":Ljava/lang/Throwable;
    invoke-virtual {v2}, Ljava/lang/Throwable;->printStackTrace()V

    goto :goto_1a

    .line 216
    .end local v2    # "t":Ljava/lang/Throwable;
    .restart local v1    # "megapixel":Lcom/adobe/creativesdk/aviary/internal/headless/utils/MegaPixels;
    :catch_36
    move-exception v2

    .line 217
    .restart local v2    # "t":Ljava/lang/Throwable;
    invoke-virtual {v2}, Ljava/lang/Throwable;->printStackTrace()V

    goto :goto_22

    .line 222
    .end local v2    # "t":Ljava/lang/Throwable;
    :cond_3b
    invoke-virtual {v1}, Lcom/adobe/creativesdk/aviary/internal/headless/utils/MegaPixels;->ordinal()I

    move-result v4

    sget-object v5, Lcom/adobe/creativesdk/aviary/internal/InternalConstants;->ORIGINAL_SIZE:Lcom/adobe/creativesdk/aviary/internal/headless/utils/MegaPixels;

    invoke-virtual {v5}, Lcom/adobe/creativesdk/aviary/internal/headless/utils/MegaPixels;->ordinal()I

    move-result v5

    if-le v4, v5, :cond_a

    .line 223
    sget-object v1, Lcom/adobe/creativesdk/aviary/internal/InternalConstants;->ORIGINAL_SIZE:Lcom/adobe/creativesdk/aviary/internal/headless/utils/MegaPixels;

    goto :goto_a
.end method

.method public final getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .registers 4
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "defaultValue"    # Ljava/lang/String;

    .prologue
    .line 336
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/utils/SharedPreferencesUtils;->preferences:Landroid/content/SharedPreferences;

    invoke-interface {v0, p1, p2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getToolList()[Ljava/lang/String;
    .registers 8

    .prologue
    const/4 v4, 0x0

    .line 139
    invoke-static {}, Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory;->getAllTools()[Ljava/lang/String;

    move-result-object v2

    .line 140
    .local v2, "orderedTools":[Ljava/lang/String;
    new-array v0, v4, [Ljava/lang/String;

    .line 142
    .local v0, "disabledTools":[Ljava/lang/String;
    const-string v5, "12.aviary.disabled.tools"

    invoke-virtual {p0, v5}, Lcom/adobe/creativesdk/aviary/utils/SharedPreferencesUtils;->hasKey(Ljava/lang/String;)Z

    move-result v5

    if-nez v5, :cond_17

    const-string v5, "12.aviary.ordered.tools"

    invoke-virtual {p0, v5}, Lcom/adobe/creativesdk/aviary/utils/SharedPreferencesUtils;->hasKey(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_2f

    .line 144
    :cond_17
    const-string v5, "12.aviary.ordered.tools"

    invoke-virtual {p0, v5}, Lcom/adobe/creativesdk/aviary/utils/SharedPreferencesUtils;->hasKey(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_23

    .line 145
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/utils/SharedPreferencesUtils;->getOrderedTools()[Ljava/lang/String;

    move-result-object v2

    .line 148
    :cond_23
    const-string v5, "12.aviary.disabled.tools"

    invoke-virtual {p0, v5}, Lcom/adobe/creativesdk/aviary/utils/SharedPreferencesUtils;->hasKey(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_2f

    .line 149
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/utils/SharedPreferencesUtils;->getDisabledTools()[Ljava/lang/String;

    move-result-object v0

    .line 153
    :cond_2f
    new-instance v1, Ljava/util/ArrayList;

    invoke-static {v2}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v5

    invoke-direct {v1, v5}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 155
    .local v1, "ordered":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    if-eqz v0, :cond_4e

    array-length v5, v0

    if-lez v5, :cond_4e

    .line 156
    array-length v5, v0

    :goto_3e
    if-ge v4, v5, :cond_4e

    aget-object v3, v0, v4

    .line 157
    .local v3, "s":Ljava/lang/String;
    invoke-interface {v1, v3}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_4b

    .line 158
    invoke-interface {v1, v3}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 156
    :cond_4b
    add-int/lit8 v4, v4, 0x1

    goto :goto_3e

    .line 162
    .end local v3    # "s":Ljava/lang/String;
    :cond_4e
    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v4

    new-array v4, v4, [Ljava/lang/String;

    invoke-interface {v1, v4}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v4

    check-cast v4, [Ljava/lang/String;

    return-object v4
.end method

.method public hasKey(Ljava/lang/String;)Z
    .registers 3
    .param p1, "key"    # Ljava/lang/String;

    .prologue
    .line 110
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/utils/SharedPreferencesUtils;->preferences:Landroid/content/SharedPreferences;

    invoke-interface {v0, p1}, Landroid/content/SharedPreferences;->contains(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public hasOverlayKey(I)Z
    .registers 4
    .param p1, "overlayId"    # I

    .prologue
    .line 387
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "aviary.overlay-."

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/adobe/creativesdk/aviary/utils/SharedPreferencesUtils;->hasKey(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public hasVibrationEnabled()Z
    .registers 3

    .prologue
    .line 395
    const-string v0, "aviary.widget.vibration"

    const/4 v1, 0x1

    invoke-virtual {p0, v0, v1}, Lcom/adobe/creativesdk/aviary/utils/SharedPreferencesUtils;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public markOverlayAsRead(I)V
    .registers 4
    .param p1, "overlayId"    # I

    .prologue
    .line 391
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "aviary.overlay-."

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x1

    invoke-virtual {p0, v0, v1}, Lcom/adobe/creativesdk/aviary/utils/SharedPreferencesUtils;->putInt(Ljava/lang/String;I)V

    .line 392
    return-void
.end method

.method public final putBoolean(Ljava/lang/String;Z)V
    .registers 5
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "value"    # Z

    .prologue
    .line 322
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/utils/SharedPreferencesUtils;->preferences:Landroid/content/SharedPreferences;

    invoke-interface {v1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    .line 323
    .local v0, "editor":Landroid/content/SharedPreferences$Editor;
    invoke-interface {v0, p1, p2}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    .line 324
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 325
    return-void
.end method

.method public final putInt(Ljava/lang/String;I)V
    .registers 5
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "value"    # I

    .prologue
    .line 316
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/utils/SharedPreferencesUtils;->preferences:Landroid/content/SharedPreferences;

    invoke-interface {v1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    .line 317
    .local v0, "editor":Landroid/content/SharedPreferences$Editor;
    invoke-interface {v0, p1, p2}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    .line 318
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 319
    return-void
.end method

.method public final putLong(Ljava/lang/String;J)V
    .registers 6
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "value"    # J

    .prologue
    .line 310
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/utils/SharedPreferencesUtils;->preferences:Landroid/content/SharedPreferences;

    invoke-interface {v1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    .line 311
    .local v0, "editor":Landroid/content/SharedPreferences$Editor;
    invoke-interface {v0, p1, p2, p3}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    .line 312
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 313
    return-void
.end method

.method public final putString(Ljava/lang/String;Ljava/lang/String;)V
    .registers 5
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/String;

    .prologue
    .line 304
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/utils/SharedPreferencesUtils;->preferences:Landroid/content/SharedPreferences;

    invoke-interface {v1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    .line 305
    .local v0, "editor":Landroid/content/SharedPreferences$Editor;
    invoke-interface {v0, p1, p2}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 306
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 307
    return-void
.end method

.method public final remove(Ljava/lang/String;)V
    .registers 4
    .param p1, "key"    # Ljava/lang/String;

    .prologue
    .line 344
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/utils/SharedPreferencesUtils;->preferences:Landroid/content/SharedPreferences;

    invoke-interface {v1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    .line 345
    .local v0, "editor":Landroid/content/SharedPreferences$Editor;
    invoke-interface {v0, p1}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 346
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 347
    return-void
.end method

.method public setCdsContentGroup(Ljava/lang/String;)V
    .registers 3
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 279
    const-string v0, "aviary.cds.content-group-name"

    invoke-virtual {p0, v0, p1}, Lcom/adobe/creativesdk/aviary/utils/SharedPreferencesUtils;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 280
    return-void
.end method

.method public setCdsContentGroupUpdateTime(J)V
    .registers 4
    .param p1, "time"    # J

    .prologue
    .line 287
    const-string v0, "aviary.cds.content-group-update-time"

    invoke-virtual {p0, v0, p1, p2}, Lcom/adobe/creativesdk/aviary/utils/SharedPreferencesUtils;->putLong(Ljava/lang/String;J)V

    .line 288
    return-void
.end method

.method public setCdsLastExecutionTime(J)V
    .registers 4
    .param p1, "time"    # J

    .prologue
    .line 300
    const-string v0, "aviary.cds.last-execution-time"

    invoke-virtual {p0, v0, p1, p2}, Lcom/adobe/creativesdk/aviary/utils/SharedPreferencesUtils;->putLong(Ljava/lang/String;J)V

    .line 301
    return-void
.end method
