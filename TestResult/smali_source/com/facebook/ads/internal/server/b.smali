.class public Lcom/facebook/ads/internal/server/b;
.super Ljava/lang/Object;


# static fields
.field private static a:Lcom/facebook/ads/internal/server/b;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    new-instance v0, Lcom/facebook/ads/internal/server/b;

    invoke-direct {v0}, Lcom/facebook/ads/internal/server/b;-><init>()V

    sput-object v0, Lcom/facebook/ads/internal/server/b;->a:Lcom/facebook/ads/internal/server/b;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static declared-synchronized a()Lcom/facebook/ads/internal/server/b;
    .registers 2

    const-class v0, Lcom/facebook/ads/internal/server/b;

    monitor-enter v0

    :try_start_3
    sget-object v1, Lcom/facebook/ads/internal/server/b;->a:Lcom/facebook/ads/internal/server/b;
    :try_end_5
    .catchall {:try_start_3 .. :try_end_5} :catchall_7

    monitor-exit v0

    return-object v1

    :catchall_7
    move-exception v1

    monitor-exit v0

    throw v1
.end method

.method private a(Lorg/json/JSONObject;)Lcom/facebook/ads/internal/server/d;
    .registers 10

    const/4 v0, 0x0

    const-string v1, "placements"

    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v1

    invoke-virtual {v1, v0}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v1

    const-string v2, "definition"

    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v2

    invoke-static {v2}, Lcom/facebook/ads/internal/dto/d;->a(Lorg/json/JSONObject;)Lcom/facebook/ads/internal/dto/d;

    move-result-object v2

    new-instance v3, Lcom/facebook/ads/internal/dto/c;

    invoke-direct {v3, v2}, Lcom/facebook/ads/internal/dto/c;-><init>(Lcom/facebook/ads/internal/dto/d;)V

    invoke-virtual {v2}, Lcom/facebook/ads/internal/dto/d;->a()Lcom/facebook/ads/internal/server/AdPlacementType;

    move-result-object v2

    const-string v4, "ads"

    invoke-virtual {v1, v4}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_60

    const-string v4, "ads"

    invoke-virtual {v1, v4}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v1

    :goto_2c
    invoke-virtual {v1}, Lorg/json/JSONArray;->length()I

    move-result v4

    if-ge v0, v4, :cond_60

    new-instance v4, Lcom/facebook/ads/internal/dto/a;

    invoke-direct {v4, v2}, Lcom/facebook/ads/internal/dto/a;-><init>(Lcom/facebook/ads/internal/server/AdPlacementType;)V

    invoke-virtual {v1, v0}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v5

    const-string v6, "adapter"

    invoke-virtual {v5, v6}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v4, v6}, Lcom/facebook/ads/internal/dto/a;->a(Ljava/lang/String;)V

    const-string v6, "data"

    invoke-virtual {v5, v6}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v6

    const-string v7, "trackers"

    invoke-virtual {v5, v7}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v5

    if-eqz v5, :cond_57

    const-string v7, "trackers"

    invoke-virtual {v6, v7, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    :cond_57
    invoke-virtual {v4, v6}, Lcom/facebook/ads/internal/dto/a;->a(Lorg/json/JSONObject;)V

    invoke-virtual {v3, v4}, Lcom/facebook/ads/internal/dto/c;->a(Lcom/facebook/ads/internal/dto/a;)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_2c

    :cond_60
    new-instance v0, Lcom/facebook/ads/internal/server/d;

    invoke-direct {v0, v3}, Lcom/facebook/ads/internal/server/d;-><init>(Lcom/facebook/ads/internal/dto/c;)V

    return-object v0
.end method

.method private b(Lorg/json/JSONObject;)Lcom/facebook/ads/internal/server/e;
    .registers 6

    :try_start_0
    const-string v0, "placements"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v0

    const-string v1, "definition"

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v0

    invoke-static {v0}, Lcom/facebook/ads/internal/dto/d;->a(Lorg/json/JSONObject;)Lcom/facebook/ads/internal/dto/d;

    move-result-object v1

    new-instance v0, Lcom/facebook/ads/internal/server/e;

    const-string v2, "message"

    const-string v3, ""

    invoke-virtual {p1, v2, v3}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    new-instance v3, Lcom/facebook/ads/internal/dto/c;

    invoke-direct {v3, v1}, Lcom/facebook/ads/internal/dto/c;-><init>(Lcom/facebook/ads/internal/dto/d;)V

    invoke-direct {v0, v2, v3}, Lcom/facebook/ads/internal/server/e;-><init>(Ljava/lang/String;Lcom/facebook/ads/internal/dto/c;)V
    :try_end_27
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_27} :catch_28

    :goto_27
    return-object v0

    :catch_28
    move-exception v0

    invoke-direct {p0, p1}, Lcom/facebook/ads/internal/server/b;->c(Lorg/json/JSONObject;)Lcom/facebook/ads/internal/server/e;

    move-result-object v0

    goto :goto_27
.end method

.method private c(Lorg/json/JSONObject;)Lcom/facebook/ads/internal/server/e;
    .registers 5

    new-instance v0, Lcom/facebook/ads/internal/server/e;

    const-string v1, "message"

    const-string v2, ""

    invoke-virtual {p1, v1, v2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/facebook/ads/internal/server/e;-><init>(Ljava/lang/String;Lcom/facebook/ads/internal/dto/c;)V

    return-object v0
.end method


# virtual methods
.method public a(Ljava/lang/String;)Lcom/facebook/ads/internal/server/c;
    .registers 6

    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1, p1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    const-string v0, "type"

    invoke-virtual {v1, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    const/4 v0, -0x1

    invoke-virtual {v2}, Ljava/lang/String;->hashCode()I

    move-result v3

    sparse-switch v3, :sswitch_data_4a

    :cond_13
    :goto_13
    packed-switch v0, :pswitch_data_54

    const-string v0, "error"

    invoke-virtual {v1, v0}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v0

    if-eqz v0, :cond_41

    invoke-direct {p0, v0}, Lcom/facebook/ads/internal/server/b;->c(Lorg/json/JSONObject;)Lcom/facebook/ads/internal/server/e;

    move-result-object v0

    :goto_22
    return-object v0

    :sswitch_23
    const-string v3, "ads"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_13

    const/4 v0, 0x0

    goto :goto_13

    :sswitch_2d
    const-string v3, "error"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_13

    const/4 v0, 0x1

    goto :goto_13

    :pswitch_37
    invoke-direct {p0, v1}, Lcom/facebook/ads/internal/server/b;->a(Lorg/json/JSONObject;)Lcom/facebook/ads/internal/server/d;

    move-result-object v0

    goto :goto_22

    :pswitch_3c
    invoke-direct {p0, v1}, Lcom/facebook/ads/internal/server/b;->b(Lorg/json/JSONObject;)Lcom/facebook/ads/internal/server/e;

    move-result-object v0

    goto :goto_22

    :cond_41
    new-instance v0, Lcom/facebook/ads/internal/server/c;

    sget-object v1, Lcom/facebook/ads/internal/server/c$a;->a:Lcom/facebook/ads/internal/server/c$a;

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/facebook/ads/internal/server/c;-><init>(Lcom/facebook/ads/internal/server/c$a;Lcom/facebook/ads/internal/dto/c;)V

    goto :goto_22

    :sswitch_data_4a
    .sparse-switch
        0x178b0 -> :sswitch_23
        0x5c4d208 -> :sswitch_2d
    .end sparse-switch

    :pswitch_data_54
    .packed-switch 0x0
        :pswitch_37
        :pswitch_3c
    .end packed-switch
.end method
