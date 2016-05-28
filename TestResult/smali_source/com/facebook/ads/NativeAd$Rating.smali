.class public Lcom/facebook/ads/NativeAd$Rating;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/facebook/ads/NativeAd;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Rating"
.end annotation


# instance fields
.field private final a:D

.field private final b:D


# direct methods
.method private constructor <init>(DD)V
    .registers 6

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-wide p1, p0, Lcom/facebook/ads/NativeAd$Rating;->a:D

    iput-wide p3, p0, Lcom/facebook/ads/NativeAd$Rating;->b:D

    return-void
.end method

.method public static fromJSONObject(Lorg/json/JSONObject;)Lcom/facebook/ads/NativeAd$Rating;
    .registers 9

    const/4 v0, 0x0

    const-wide/16 v6, 0x0

    if-nez p0, :cond_6

    :cond_5
    :goto_5
    return-object v0

    :cond_6
    const-string v1, "value"

    invoke-virtual {p0, v1, v6, v7}, Lorg/json/JSONObject;->optDouble(Ljava/lang/String;D)D

    move-result-wide v2

    const-string v1, "scale"

    invoke-virtual {p0, v1, v6, v7}, Lorg/json/JSONObject;->optDouble(Ljava/lang/String;D)D

    move-result-wide v4

    cmpl-double v1, v2, v6

    if-eqz v1, :cond_5

    cmpl-double v1, v4, v6

    if-eqz v1, :cond_5

    new-instance v0, Lcom/facebook/ads/NativeAd$Rating;

    invoke-direct {v0, v2, v3, v4, v5}, Lcom/facebook/ads/NativeAd$Rating;-><init>(DD)V

    goto :goto_5
.end method
