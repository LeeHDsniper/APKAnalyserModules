.class public Lcom/facebook/ads/internal/util/g;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/facebook/ads/internal/util/g$a;
    }
.end annotation


# static fields
.field private static final a:Landroid/net/Uri;

.field private static final b:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    const-string v0, "content://com.facebook.katana.provider.AttributionIdProvider"

    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    sput-object v0, Lcom/facebook/ads/internal/util/g;->a:Landroid/net/Uri;

    const-class v0, Lcom/facebook/ads/internal/util/g;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/facebook/ads/internal/util/g;->b:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static a(Lcom/facebook/ads/AdSize;)Lcom/facebook/ads/internal/e;
    .registers 3

    sget-object v0, Lcom/facebook/ads/internal/util/g$1;->a:[I

    invoke-virtual {p0}, Lcom/facebook/ads/AdSize;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_1a

    sget-object v0, Lcom/facebook/ads/internal/e;->b:Lcom/facebook/ads/internal/e;

    :goto_d
    return-object v0

    :pswitch_e
    sget-object v0, Lcom/facebook/ads/internal/e;->f:Lcom/facebook/ads/internal/e;

    goto :goto_d

    :pswitch_11
    sget-object v0, Lcom/facebook/ads/internal/e;->e:Lcom/facebook/ads/internal/e;

    goto :goto_d

    :pswitch_14
    sget-object v0, Lcom/facebook/ads/internal/e;->d:Lcom/facebook/ads/internal/e;

    goto :goto_d

    :pswitch_17
    sget-object v0, Lcom/facebook/ads/internal/e;->c:Lcom/facebook/ads/internal/e;

    goto :goto_d

    :pswitch_data_1a
    .packed-switch 0x1
        :pswitch_e
        :pswitch_11
        :pswitch_14
        :pswitch_17
    .end packed-switch
.end method

.method public static a(Landroid/content/ContentResolver;)Lcom/facebook/ads/internal/util/g$a;
    .registers 8

    const/4 v6, 0x0

    const/4 v0, 0x3

    :try_start_2
    new-array v2, v0, [Ljava/lang/String;

    const/4 v0, 0x0

    const-string v1, "aid"

    aput-object v1, v2, v0

    const/4 v0, 0x1

    const-string v1, "androidid"

    aput-object v1, v2, v0

    const/4 v0, 0x2

    const-string v1, "limit_tracking"

    aput-object v1, v2, v0

    sget-object v1, Lcom/facebook/ads/internal/util/g;->a:Landroid/net/Uri;

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    move-object v0, p0

    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;
    :try_end_1c
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_1c} :catch_64
    .catchall {:try_start_2 .. :try_end_1c} :catchall_74

    move-result-object v1

    if-eqz v1, :cond_25

    :try_start_1f
    invoke-interface {v1}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v0

    if-nez v0, :cond_33

    :cond_25
    new-instance v0, Lcom/facebook/ads/internal/util/g$a;

    const/4 v2, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x0

    invoke-direct {v0, v2, v3, v4}, Lcom/facebook/ads/internal/util/g$a;-><init>(Ljava/lang/String;Ljava/lang/String;Z)V
    :try_end_2d
    .catch Ljava/lang/Exception; {:try_start_1f .. :try_end_2d} :catch_7e
    .catchall {:try_start_1f .. :try_end_2d} :catchall_7c

    if-eqz v1, :cond_32

    invoke-interface {v1}, Landroid/database/Cursor;->close()V

    :cond_32
    :goto_32
    return-object v0

    :cond_33
    :try_start_33
    const-string v0, "aid"

    invoke-interface {v1, v0}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v0

    invoke-interface {v1, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v2

    const-string v0, "androidid"

    invoke-interface {v1, v0}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v0

    invoke-interface {v1, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v3

    const-string v0, "limit_tracking"

    invoke-interface {v1, v0}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v0

    invoke-interface {v1, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Ljava/lang/String;)Ljava/lang/Boolean;

    move-result-object v4

    new-instance v0, Lcom/facebook/ads/internal/util/g$a;

    invoke-virtual {v4}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v4

    invoke-direct {v0, v2, v3, v4}, Lcom/facebook/ads/internal/util/g$a;-><init>(Ljava/lang/String;Ljava/lang/String;Z)V
    :try_end_5e
    .catch Ljava/lang/Exception; {:try_start_33 .. :try_end_5e} :catch_7e
    .catchall {:try_start_33 .. :try_end_5e} :catchall_7c

    if-eqz v1, :cond_32

    invoke-interface {v1}, Landroid/database/Cursor;->close()V

    goto :goto_32

    :catch_64
    move-exception v0

    move-object v1, v6

    :goto_66
    :try_start_66
    new-instance v0, Lcom/facebook/ads/internal/util/g$a;

    const/4 v2, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x0

    invoke-direct {v0, v2, v3, v4}, Lcom/facebook/ads/internal/util/g$a;-><init>(Ljava/lang/String;Ljava/lang/String;Z)V
    :try_end_6e
    .catchall {:try_start_66 .. :try_end_6e} :catchall_7c

    if-eqz v1, :cond_32

    invoke-interface {v1}, Landroid/database/Cursor;->close()V

    goto :goto_32

    :catchall_74
    move-exception v0

    move-object v1, v6

    :goto_76
    if-eqz v1, :cond_7b

    invoke-interface {v1}, Landroid/database/Cursor;->close()V

    :cond_7b
    throw v0

    :catchall_7c
    move-exception v0

    goto :goto_76

    :catch_7e
    move-exception v0

    goto :goto_66
.end method

.method public static varargs a(Ljava/lang/Object;Ljava/lang/reflect/Method;[Ljava/lang/Object;)Ljava/lang/Object;
    .registers 4

    :try_start_0
    invoke-virtual {p1, p0, p2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_3} :catch_5

    move-result-object v0

    :goto_4
    return-object v0

    :catch_5
    move-exception v0

    const/4 v0, 0x0

    goto :goto_4
.end method

.method public static a(Ljava/io/InputStream;)Ljava/lang/String;
    .registers 6

    new-instance v0, Ljava/io/StringWriter;

    invoke-direct {v0}, Ljava/io/StringWriter;-><init>()V

    new-instance v1, Ljava/io/InputStreamReader;

    invoke-direct {v1, p0}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;)V

    const/16 v2, 0x1000

    new-array v2, v2, [C

    :goto_e
    invoke-virtual {v1, v2}, Ljava/io/InputStreamReader;->read([C)I

    move-result v3

    const/4 v4, -0x1

    if-eq v3, v4, :cond_1a

    const/4 v4, 0x0

    invoke-virtual {v0, v2, v4, v3}, Ljava/io/StringWriter;->write([CII)V

    goto :goto_e

    :cond_1a
    invoke-virtual {v0}, Ljava/io/StringWriter;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0}, Ljava/io/StringWriter;->close()V

    invoke-virtual {v1}, Ljava/io/InputStreamReader;->close()V

    return-object v2
.end method

.method public static a(Ljava/util/Map;)Ljava/lang/String;
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;)",
            "Ljava/lang/String;"
        }
    .end annotation

    new-instance v2, Lorg/json/JSONObject;

    invoke-direct {v2}, Lorg/json/JSONObject;-><init>()V

    invoke-interface {p0}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_d
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_2c

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    :try_start_19
    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {v2, v1, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_26
    .catch Lorg/json/JSONException; {:try_start_19 .. :try_end_26} :catch_27

    goto :goto_d

    :catch_27
    move-exception v0

    invoke-virtual {v0}, Lorg/json/JSONException;->printStackTrace()V

    goto :goto_d

    :cond_2c
    invoke-virtual {v2}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static a([B)Ljava/lang/String;
    .registers 4

    :try_start_0
    new-instance v1, Ljava/io/ByteArrayInputStream;

    invoke-direct {v1, p0}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    new-instance v2, Ljava/util/zip/GZIPInputStream;

    invoke-direct {v2, v1}, Ljava/util/zip/GZIPInputStream;-><init>(Ljava/io/InputStream;)V

    invoke-static {v2}, Lcom/facebook/ads/internal/util/g;->a(Ljava/io/InputStream;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2}, Ljava/util/zip/GZIPInputStream;->close()V

    invoke-virtual {v1}, Ljava/io/ByteArrayInputStream;->close()V
    :try_end_14
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_14} :catch_15

    :goto_14
    return-object v0

    :catch_15
    move-exception v0

    const-string v1, "Error decompressing data"

    invoke-static {v0, v1}, Lcom/facebook/ads/internal/util/b;->a(Ljava/lang/Throwable;Ljava/lang/String;)Lcom/facebook/ads/internal/util/b;

    move-result-object v1

    invoke-static {v1}, Lcom/facebook/ads/internal/util/c;->a(Lcom/facebook/ads/internal/util/b;)V

    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    const-string v0, ""

    goto :goto_14
.end method

.method public static varargs a(Ljava/lang/Class;Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;",
            "Ljava/lang/String;",
            "[",
            "Ljava/lang/Class",
            "<*>;)",
            "Ljava/lang/reflect/Method;"
        }
    .end annotation

    :try_start_0
    invoke-virtual {p0, p1, p2}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;
    :try_end_3
    .catch Ljava/lang/NoSuchMethodException; {:try_start_0 .. :try_end_3} :catch_5

    move-result-object v0

    :goto_4
    return-object v0

    :catch_5
    move-exception v0

    const/4 v0, 0x0

    goto :goto_4
.end method

.method public static varargs a(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "[",
            "Ljava/lang/Class",
            "<*>;)",
            "Ljava/lang/reflect/Method;"
        }
    .end annotation

    :try_start_0
    invoke-static {p0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    invoke-static {v0, p1, p2}, Lcom/facebook/ads/internal/util/g;->a(Ljava/lang/Class;Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;
    :try_end_7
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_7} :catch_9

    move-result-object v0

    :goto_8
    return-object v0

    :catch_9
    move-exception v0

    const/4 v0, 0x0

    goto :goto_8
.end method

.method public static a(Landroid/content/Context;Ljava/lang/String;)V
    .registers 5

    invoke-static {p0}, Lcom/facebook/ads/AdSettings;->isTestMode(Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_1e

    const-string v0, "FBAudienceNetworkLog"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " (displayed for test ads only)"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    :cond_1e
    return-void
.end method

.method public static a(Landroid/view/View;ZLjava/lang/String;)V
    .registers 3

    return-void
.end method

.method public static a()Z
    .registers 2

    invoke-static {}, Lcom/facebook/ads/AdSettings;->getUrlPrefix()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/facebook/ads/internal/util/s;->a(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_14

    const-string v1, ".sb"

    invoke-virtual {v0, v1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_14

    const/4 v0, 0x1

    :goto_13
    return v0

    :cond_14
    const/4 v0, 0x0

    goto :goto_13
.end method

.method public static a(Landroid/content/Context;)Z
    .registers 3

    const/4 v1, 0x0

    :try_start_1
    const-string v0, "power"

    invoke-virtual {p0, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/os/PowerManager;

    invoke-virtual {v0}, Landroid/os/PowerManager;->isScreenOn()Z

    move-result v0

    if-nez v0, :cond_11

    move v0, v1

    :goto_10
    return v0

    :cond_11
    const-string v0, "keyguard"

    invoke-virtual {p0, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/KeyguardManager;

    invoke-virtual {v0}, Landroid/app/KeyguardManager;->inKeyguardRestrictedInputMode()Z
    :try_end_1c
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1c} :catch_21

    move-result v0

    if-eqz v0, :cond_24

    move v0, v1

    goto :goto_10

    :catch_21
    move-exception v0

    move v0, v1

    goto :goto_10

    :cond_24
    const/4 v0, 0x1

    goto :goto_10
.end method

.method public static a(Landroid/content/Context;Landroid/view/View;I)Z
    .registers 13

    if-nez p1, :cond_a

    const/4 v0, 0x0

    const-string v1, "adView is null."

    invoke-static {p1, v0, v1}, Lcom/facebook/ads/internal/util/g;->a(Landroid/view/View;ZLjava/lang/String;)V

    const/4 v0, 0x0

    :goto_9
    return v0

    :cond_a
    invoke-virtual {p1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    if-nez v0, :cond_18

    const/4 v0, 0x0

    const-string v1, "adView has no parent."

    invoke-static {p1, v0, v1}, Lcom/facebook/ads/internal/util/g;->a(Landroid/view/View;ZLjava/lang/String;)V

    const/4 v0, 0x0

    goto :goto_9

    :cond_18
    invoke-virtual {p1}, Landroid/view/View;->getVisibility()I

    move-result v0

    if-eqz v0, :cond_26

    const/4 v0, 0x0

    const-string v1, "adView is not set to VISIBLE."

    invoke-static {p1, v0, v1}, Lcom/facebook/ads/internal/util/g;->a(Landroid/view/View;ZLjava/lang/String;)V

    const/4 v0, 0x0

    goto :goto_9

    :cond_26
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0xb

    if-lt v0, v1, :cond_3f

    invoke-virtual {p1}, Landroid/view/View;->getAlpha()F

    move-result v0

    const v1, 0x3f666666

    cmpg-float v0, v0, v1

    if-gez v0, :cond_3f

    const/4 v0, 0x0

    const-string v1, "adView is too transparent."

    invoke-static {p1, v0, v1}, Lcom/facebook/ads/internal/util/g;->a(Landroid/view/View;ZLjava/lang/String;)V

    const/4 v0, 0x0

    goto :goto_9

    :cond_3f
    invoke-virtual {p1}, Landroid/view/View;->getWidth()I

    move-result v0

    invoke-virtual {p1}, Landroid/view/View;->getHeight()I

    move-result v1

    const/4 v2, 0x2

    new-array v2, v2, [I

    :try_start_4a
    invoke-virtual {p1, v2}, Landroid/view/View;->getLocationOnScreen([I)V
    :try_end_4d
    .catch Ljava/lang/NullPointerException; {:try_start_4a .. :try_end_4d} :catch_6a

    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    invoke-virtual {v3}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v3

    const/4 v4, 0x0

    aget v4, v2, v4

    if-ltz v4, :cond_62

    iget v4, v3, Landroid/util/DisplayMetrics;->widthPixels:I

    const/4 v5, 0x0

    aget v5, v2, v5

    sub-int/2addr v4, v5

    if-ge v4, v0, :cond_73

    :cond_62
    const/4 v0, 0x0

    const-string v1, "adView is not fully on screen horizontally."

    invoke-static {p1, v0, v1}, Lcom/facebook/ads/internal/util/g;->a(Landroid/view/View;ZLjava/lang/String;)V

    const/4 v0, 0x0

    goto :goto_9

    :catch_6a
    move-exception v0

    const/4 v0, 0x0

    const-string v1, "Cannot get location on screen."

    invoke-static {p1, v0, v1}, Lcom/facebook/ads/internal/util/g;->a(Landroid/view/View;ZLjava/lang/String;)V

    const/4 v0, 0x0

    goto :goto_9

    :cond_73
    int-to-double v4, v1

    const-wide/high16 v6, 0x4059000000000000L

    int-to-double v8, p2

    sub-double/2addr v6, v8

    mul-double/2addr v4, v6

    const-wide/high16 v6, 0x4059000000000000L

    div-double/2addr v4, v6

    double-to-int v0, v4

    const/4 v4, 0x1

    aget v4, v2, v4

    if-gez v4, :cond_94

    const/4 v4, 0x1

    aget v4, v2, v4

    invoke-static {v4}, Ljava/lang/Math;->abs(I)I

    move-result v4

    if-le v4, v0, :cond_94

    const/4 v0, 0x0

    const-string v1, "adView is not visible from the top."

    invoke-static {p1, v0, v1}, Lcom/facebook/ads/internal/util/g;->a(Landroid/view/View;ZLjava/lang/String;)V

    const/4 v0, 0x0

    goto/16 :goto_9

    :cond_94
    const/4 v4, 0x1

    aget v2, v2, v4

    add-int/2addr v1, v2

    iget v2, v3, Landroid/util/DisplayMetrics;->heightPixels:I

    sub-int/2addr v1, v2

    if-le v1, v0, :cond_a6

    const/4 v0, 0x0

    const-string v1, "adView is not visible from the bottom."

    invoke-static {p1, v0, v1}, Lcom/facebook/ads/internal/util/g;->a(Landroid/view/View;ZLjava/lang/String;)V

    const/4 v0, 0x0

    goto/16 :goto_9

    :cond_a6
    const/4 v0, 0x1

    const-string v1, "adView is visible."

    invoke-static {p1, v0, v1}, Lcom/facebook/ads/internal/util/g;->a(Landroid/view/View;ZLjava/lang/String;)V

    invoke-static {p0}, Lcom/facebook/ads/internal/util/g;->a(Landroid/content/Context;)Z

    move-result v0

    goto/16 :goto_9
.end method

.method public static a(Ljava/lang/String;)[B
    .registers 4

    :try_start_0
    new-instance v1, Ljava/io/ByteArrayOutputStream;

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    invoke-direct {v1, v0}, Ljava/io/ByteArrayOutputStream;-><init>(I)V

    new-instance v0, Ljava/util/zip/GZIPOutputStream;

    invoke-direct {v0, v1}, Ljava/util/zip/GZIPOutputStream;-><init>(Ljava/io/OutputStream;)V

    invoke-virtual {p0}, Ljava/lang/String;->getBytes()[B

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/util/zip/GZIPOutputStream;->write([B)V

    invoke-virtual {v0}, Ljava/util/zip/GZIPOutputStream;->close()V

    invoke-virtual {v1}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v0

    invoke-virtual {v1}, Ljava/io/ByteArrayOutputStream;->close()V
    :try_end_1f
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_1f} :catch_20

    :goto_1f
    return-object v0

    :catch_20
    move-exception v0

    const-string v1, "Error compressing data"

    invoke-static {v0, v1}, Lcom/facebook/ads/internal/util/b;->a(Ljava/lang/Throwable;Ljava/lang/String;)Lcom/facebook/ads/internal/util/b;

    move-result-object v1

    invoke-static {v1}, Lcom/facebook/ads/internal/util/c;->a(Lcom/facebook/ads/internal/util/b;)V

    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    const/4 v0, 0x0

    new-array v0, v0, [B

    goto :goto_1f
.end method

.method public static b()Lorg/apache/http/client/HttpClient;
    .registers 8

    const/16 v0, 0x7530

    new-instance v1, Lorg/apache/http/impl/client/DefaultHttpClient;

    invoke-direct {v1}, Lorg/apache/http/impl/client/DefaultHttpClient;-><init>()V

    invoke-virtual {v1}, Lorg/apache/http/impl/client/DefaultHttpClient;->getParams()Lorg/apache/http/params/HttpParams;

    move-result-object v2

    invoke-static {v2, v0}, Lorg/apache/http/params/HttpConnectionParams;->setConnectionTimeout(Lorg/apache/http/params/HttpParams;I)V

    invoke-static {v2, v0}, Lorg/apache/http/params/HttpConnectionParams;->setSoTimeout(Lorg/apache/http/params/HttpParams;I)V

    invoke-static {}, Lcom/facebook/ads/internal/util/g;->a()Z

    move-result v0

    if-eqz v0, :cond_65

    :try_start_17
    invoke-static {}, Ljava/security/KeyStore;->getDefaultType()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/security/KeyStore;->getInstance(Ljava/lang/String;)Ljava/security/KeyStore;

    move-result-object v0

    const/4 v3, 0x0

    const/4 v4, 0x0

    invoke-virtual {v0, v3, v4}, Ljava/security/KeyStore;->load(Ljava/io/InputStream;[C)V

    new-instance v3, Lcom/facebook/ads/internal/util/q;

    invoke-direct {v3, v0}, Lcom/facebook/ads/internal/util/q;-><init>(Ljava/security/KeyStore;)V

    sget-object v0, Lorg/apache/http/conn/ssl/SSLSocketFactory;->ALLOW_ALL_HOSTNAME_VERIFIER:Lorg/apache/http/conn/ssl/X509HostnameVerifier;

    invoke-virtual {v3, v0}, Lorg/apache/http/conn/ssl/SSLSocketFactory;->setHostnameVerifier(Lorg/apache/http/conn/ssl/X509HostnameVerifier;)V

    sget-object v0, Lorg/apache/http/HttpVersion;->HTTP_1_1:Lorg/apache/http/HttpVersion;

    invoke-static {v2, v0}, Lorg/apache/http/params/HttpProtocolParams;->setVersion(Lorg/apache/http/params/HttpParams;Lorg/apache/http/ProtocolVersion;)V

    const-string v0, "UTF-8"

    invoke-static {v2, v0}, Lorg/apache/http/params/HttpProtocolParams;->setContentCharset(Lorg/apache/http/params/HttpParams;Ljava/lang/String;)V

    new-instance v0, Lorg/apache/http/conn/scheme/SchemeRegistry;

    invoke-direct {v0}, Lorg/apache/http/conn/scheme/SchemeRegistry;-><init>()V

    new-instance v4, Lorg/apache/http/conn/scheme/Scheme;

    const-string v5, "http"

    invoke-static {}, Lorg/apache/http/conn/scheme/PlainSocketFactory;->getSocketFactory()Lorg/apache/http/conn/scheme/PlainSocketFactory;

    move-result-object v6

    const/16 v7, 0x50

    invoke-direct {v4, v5, v6, v7}, Lorg/apache/http/conn/scheme/Scheme;-><init>(Ljava/lang/String;Lorg/apache/http/conn/scheme/SocketFactory;I)V

    invoke-virtual {v0, v4}, Lorg/apache/http/conn/scheme/SchemeRegistry;->register(Lorg/apache/http/conn/scheme/Scheme;)Lorg/apache/http/conn/scheme/Scheme;

    new-instance v4, Lorg/apache/http/conn/scheme/Scheme;

    const-string v5, "https"

    const/16 v6, 0x1bb

    invoke-direct {v4, v5, v3, v6}, Lorg/apache/http/conn/scheme/Scheme;-><init>(Ljava/lang/String;Lorg/apache/http/conn/scheme/SocketFactory;I)V

    invoke-virtual {v0, v4}, Lorg/apache/http/conn/scheme/SchemeRegistry;->register(Lorg/apache/http/conn/scheme/Scheme;)Lorg/apache/http/conn/scheme/Scheme;

    new-instance v3, Lorg/apache/http/impl/conn/tsccm/ThreadSafeClientConnManager;

    invoke-direct {v3, v2, v0}, Lorg/apache/http/impl/conn/tsccm/ThreadSafeClientConnManager;-><init>(Lorg/apache/http/params/HttpParams;Lorg/apache/http/conn/scheme/SchemeRegistry;)V

    new-instance v0, Lorg/apache/http/impl/client/DefaultHttpClient;

    invoke-direct {v0, v3, v2}, Lorg/apache/http/impl/client/DefaultHttpClient;-><init>(Lorg/apache/http/conn/ClientConnectionManager;Lorg/apache/http/params/HttpParams;)V
    :try_end_63
    .catch Ljava/lang/Exception; {:try_start_17 .. :try_end_63} :catch_64

    :goto_63
    return-object v0

    :catch_64
    move-exception v0

    :cond_65
    move-object v0, v1

    goto :goto_63
.end method
