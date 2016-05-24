.class public abstract Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsJsonParser;
.super Ljava/lang/Object;
.source "CdsJsonParser.java"


# instance fields
.field protected mCode:I

.field protected mStatus:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 19
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final getCode()I
    .registers 2

    .prologue
    .line 41
    iget v0, p0, Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsJsonParser;->mCode:I

    return v0
.end method

.method public final getStatus()Ljava/lang/String;
    .registers 2

    .prologue
    .line 45
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsJsonParser;->mStatus:Ljava/lang/String;

    return-object v0
.end method

.method protected abstract onParseJson(Lorg/json/JSONObject;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation
.end method

.method public parse(Ljava/io/InputStream;)I
    .registers 3
    .param p1, "stream"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 22
    invoke-static {p1}, Lcom/adobe/creativesdk/aviary/internal/utils/IOUtils;->readFully(Ljava/io/InputStream;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsJsonParser;->parse(Ljava/lang/String;)I

    move-result v0

    return v0
.end method

.method public parse(Ljava/lang/String;)I
    .registers 3
    .param p1, "string"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 26
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0, p1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, v0}, Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsJsonParser;->parse(Lorg/json/JSONObject;)I

    move-result v0

    return v0
.end method

.method public parse(Lorg/json/JSONObject;)I
    .registers 4
    .param p1, "json"    # Lorg/json/JSONObject;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 30
    const-string v0, "code"

    const/4 v1, -0x1

    invoke-virtual {p1, v0, v1}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    move-result v0

    iput v0, p0, Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsJsonParser;->mCode:I

    .line 31
    const-string v0, "status"

    const-string v1, "none"

    invoke-virtual {p1, v0, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsJsonParser;->mStatus:Ljava/lang/String;

    .line 33
    iget v0, p0, Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsJsonParser;->mCode:I

    if-nez v0, :cond_1a

    .line 34
    invoke-virtual {p0, p1}, Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsJsonParser;->onParseJson(Lorg/json/JSONObject;)V

    .line 37
    :cond_1a
    iget v0, p0, Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsJsonParser;->mCode:I

    return v0
.end method
