.class public Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsContentParser$ContentItem;
.super Ljava/lang/Object;
.source "CdsContentParser.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsContentParser;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "ContentItem"
.end annotation


# instance fields
.field final displayName:Ljava/lang/String;

.field final identifier:Ljava/lang/String;

.field final options:[B


# direct methods
.method constructor <init>(Ljava/lang/String;Ljava/lang/String;Lorg/json/JSONObject;)V
    .registers 5
    .param p1, "identifier"    # Ljava/lang/String;
    .param p2, "displayName"    # Ljava/lang/String;
    .param p3, "options"    # Lorg/json/JSONObject;

    .prologue
    .line 18
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 19
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsContentParser$ContentItem;->identifier:Ljava/lang/String;

    .line 20
    iput-object p2, p0, Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsContentParser$ContentItem;->displayName:Ljava/lang/String;

    .line 21
    if-eqz p3, :cond_14

    .line 22
    invoke-virtual {p3}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->getBytes()[B

    move-result-object v0

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsContentParser$ContentItem;->options:[B

    .line 26
    :goto_13
    return-void

    .line 24
    :cond_14
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsContentParser$ContentItem;->options:[B

    goto :goto_13
.end method

.method public static create(Lorg/json/JSONObject;)Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsContentParser$ContentItem;
    .registers 5
    .param p0, "json"    # Lorg/json/JSONObject;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 46
    const-string v3, "identifier"

    invoke-virtual {p0, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 47
    .local v1, "identifier":Ljava/lang/String;
    const-string v3, "displayName"

    invoke-virtual {p0, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 48
    .local v0, "displayName":Ljava/lang/String;
    const-string v3, "options"

    invoke-virtual {p0, v3}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v2

    .line 49
    .local v2, "options":Lorg/json/JSONObject;
    new-instance v3, Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsContentParser$ContentItem;

    invoke-direct {v3, v1, v0, v2}, Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsContentParser$ContentItem;-><init>(Ljava/lang/String;Ljava/lang/String;Lorg/json/JSONObject;)V

    return-object v3
.end method


# virtual methods
.method public getDisplayName()Ljava/lang/String;
    .registers 2

    .prologue
    .line 33
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsContentParser$ContentItem;->displayName:Ljava/lang/String;

    return-object v0
.end method

.method public getIdentifier()Ljava/lang/String;
    .registers 2

    .prologue
    .line 29
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsContentParser$ContentItem;->identifier:Ljava/lang/String;

    return-object v0
.end method

.method public getOptions()[B
    .registers 2

    .prologue
    .line 37
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsContentParser$ContentItem;->options:[B

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .registers 3

    .prologue
    .line 42
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "{"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsContentParser$ContentItem;->identifier:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsContentParser$ContentItem;->displayName:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsContentParser$ContentItem;->options:[B

    if-eqz v0, :cond_38

    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsContentParser$ContentItem;->options:[B

    :goto_29
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "}"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0

    :cond_38
    const-string v0, "null"

    goto :goto_29
.end method
