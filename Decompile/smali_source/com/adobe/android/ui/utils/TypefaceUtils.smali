.class public final Lcom/adobe/android/ui/utils/TypefaceUtils;
.super Ljava/lang/Object;
.source "TypefaceUtils.java"


# static fields
.field private static final S_TYPE_CACHE:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Landroid/graphics/Typeface;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 12
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lcom/adobe/android/ui/utils/TypefaceUtils;->S_TYPE_CACHE:Ljava/util/HashMap;

    return-void
.end method

.method public static createFromAsset(Landroid/content/res/AssetManager;Ljava/lang/String;)Landroid/graphics/Typeface;
    .registers 5
    .param p0, "assets"    # Landroid/content/res/AssetManager;
    .param p1, "fontname"    # Ljava/lang/String;

    .prologue
    .line 18
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_8

    if-nez p0, :cond_a

    .line 19
    :cond_8
    const/4 v1, 0x0

    .line 32
    :goto_9
    return-object v1

    .line 23
    :cond_a
    invoke-static {p1}, Lcom/adobe/android/ui/utils/TypefaceUtils;->getFromCache(Ljava/lang/String;)Landroid/graphics/Typeface;

    move-result-object v0

    .line 25
    .local v0, "cachedFont":Landroid/graphics/Typeface;
    if-eqz v0, :cond_12

    .line 26
    move-object v1, v0

    .local v1, "result":Landroid/graphics/Typeface;
    goto :goto_9

    .line 28
    .end local v1    # "result":Landroid/graphics/Typeface;
    :cond_12
    invoke-static {p0, p1}, Landroid/graphics/Typeface;->createFromAsset(Landroid/content/res/AssetManager;Ljava/lang/String;)Landroid/graphics/Typeface;

    move-result-object v1

    .line 29
    .restart local v1    # "result":Landroid/graphics/Typeface;
    invoke-static {p1, v1}, Lcom/adobe/android/ui/utils/TypefaceUtils;->putIntoCache(Ljava/lang/String;Landroid/graphics/Typeface;)V

    goto :goto_9
.end method

.method private static getFromCache(Ljava/lang/String;)Landroid/graphics/Typeface;
    .registers 3
    .param p0, "fontname"    # Ljava/lang/String;

    .prologue
    .line 36
    sget-object v1, Lcom/adobe/android/ui/utils/TypefaceUtils;->S_TYPE_CACHE:Ljava/util/HashMap;

    monitor-enter v1

    .line 37
    :try_start_3
    sget-object v0, Lcom/adobe/android/ui/utils/TypefaceUtils;->S_TYPE_CACHE:Ljava/util/HashMap;

    invoke-virtual {v0, p0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/graphics/Typeface;

    monitor-exit v1

    return-object v0

    .line 38
    :catchall_d
    move-exception v0

    monitor-exit v1
    :try_end_f
    .catchall {:try_start_3 .. :try_end_f} :catchall_d

    throw v0
.end method

.method private static putIntoCache(Ljava/lang/String;Landroid/graphics/Typeface;)V
    .registers 4
    .param p0, "fontname"    # Ljava/lang/String;
    .param p1, "font"    # Landroid/graphics/Typeface;

    .prologue
    .line 42
    sget-object v1, Lcom/adobe/android/ui/utils/TypefaceUtils;->S_TYPE_CACHE:Ljava/util/HashMap;

    monitor-enter v1

    .line 43
    :try_start_3
    sget-object v0, Lcom/adobe/android/ui/utils/TypefaceUtils;->S_TYPE_CACHE:Ljava/util/HashMap;

    invoke-virtual {v0, p0, p1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 44
    monitor-exit v1

    .line 45
    return-void

    .line 44
    :catchall_a
    move-exception v0

    monitor-exit v1
    :try_end_c
    .catchall {:try_start_3 .. :try_end_c} :catchall_a

    throw v0
.end method
