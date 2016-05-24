.class public Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsMessageContentParser;
.super Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsJsonParser;
.source "CdsMessageContentParser.java"


# instance fields
.field actionButtonText:Ljava/lang/String;

.field beginDate:J

.field contentIdentifier:Ljava/lang/String;

.field contentURL:Ljava/lang/String;

.field dismissButtonText:Ljava/lang/String;

.field endDate:J

.field identifier:Ljava/lang/String;

.field layoutStyle:Ljava/lang/String;

.field paragraph:Ljava/lang/String;

.field showNewBanner:Z

.field splitButton:Z

.field title:Ljava/lang/String;

.field versionKey:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 23
    invoke-direct {p0}, Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsJsonParser;-><init>()V

    .line 24
    return-void
.end method


# virtual methods
.method public getActionButtonText()Ljava/lang/String;
    .registers 2

    .prologue
    .line 63
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsMessageContentParser;->actionButtonText:Ljava/lang/String;

    return-object v0
.end method

.method public getBeginDate()J
    .registers 3

    .prologue
    .line 43
    iget-wide v0, p0, Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsMessageContentParser;->beginDate:J

    return-wide v0
.end method

.method public getContentIdentifier()Ljava/lang/String;
    .registers 2

    .prologue
    .line 39
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsMessageContentParser;->contentIdentifier:Ljava/lang/String;

    return-object v0
.end method

.method public getContentURL()Ljava/lang/String;
    .registers 2

    .prologue
    .line 35
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsMessageContentParser;->contentURL:Ljava/lang/String;

    return-object v0
.end method

.method public getDismissButtonText()Ljava/lang/String;
    .registers 2

    .prologue
    .line 59
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsMessageContentParser;->dismissButtonText:Ljava/lang/String;

    return-object v0
.end method

.method public getEndDate()J
    .registers 3

    .prologue
    .line 47
    iget-wide v0, p0, Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsMessageContentParser;->endDate:J

    return-wide v0
.end method

.method public getIdentifier()Ljava/lang/String;
    .registers 2

    .prologue
    .line 27
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsMessageContentParser;->identifier:Ljava/lang/String;

    return-object v0
.end method

.method public getLayoutStyle()Ljava/lang/String;
    .registers 2

    .prologue
    .line 67
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsMessageContentParser;->layoutStyle:Ljava/lang/String;

    return-object v0
.end method

.method public getParagraph()Ljava/lang/String;
    .registers 2

    .prologue
    .line 55
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsMessageContentParser;->paragraph:Ljava/lang/String;

    return-object v0
.end method

.method public getTitle()Ljava/lang/String;
    .registers 2

    .prologue
    .line 51
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsMessageContentParser;->title:Ljava/lang/String;

    return-object v0
.end method

.method public getVersionKey()Ljava/lang/String;
    .registers 2

    .prologue
    .line 31
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsMessageContentParser;->versionKey:Ljava/lang/String;

    return-object v0
.end method

.method public isShowNewBanner()Z
    .registers 2

    .prologue
    .line 71
    iget-boolean v0, p0, Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsMessageContentParser;->showNewBanner:Z

    return v0
.end method

.method public isSplitButton()Z
    .registers 2

    .prologue
    .line 75
    iget-boolean v0, p0, Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsMessageContentParser;->splitButton:Z

    return v0
.end method

.method protected onParseJson(Lorg/json/JSONObject;)V
    .registers 4
    .param p1, "json"    # Lorg/json/JSONObject;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 80
    const-string v0, "identifier"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsMessageContentParser;->identifier:Ljava/lang/String;

    .line 81
    const-string v0, "versionKey"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsMessageContentParser;->versionKey:Ljava/lang/String;

    .line 82
    const-string v0, "contentIdentifier"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsMessageContentParser;->contentIdentifier:Ljava/lang/String;

    .line 83
    const-string v0, "beginDate"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->getLong(Ljava/lang/String;)J

    move-result-wide v0

    iput-wide v0, p0, Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsMessageContentParser;->beginDate:J

    .line 84
    const-string v0, "endDate"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->getLong(Ljava/lang/String;)J

    move-result-wide v0

    iput-wide v0, p0, Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsMessageContentParser;->endDate:J

    .line 85
    const-string v0, "contentURL"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsMessageContentParser;->contentURL:Ljava/lang/String;

    .line 86
    const-string v0, "title"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsMessageContentParser;->title:Ljava/lang/String;

    .line 87
    const-string v0, "paragraph"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsMessageContentParser;->paragraph:Ljava/lang/String;

    .line 88
    const-string v0, "dismissButtonText"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsMessageContentParser;->dismissButtonText:Ljava/lang/String;

    .line 89
    const-string v0, "actionButtonText"

    const-string v1, "Yes"

    invoke-virtual {p1, v0, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsMessageContentParser;->actionButtonText:Ljava/lang/String;

    .line 90
    const-string v0, "layoutStyle"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsMessageContentParser;->layoutStyle:Ljava/lang/String;

    .line 91
    const-string v0, "showsNewBanner"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->getBoolean(Ljava/lang/String;)Z

    move-result v0

    iput-boolean v0, p0, Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsMessageContentParser;->showNewBanner:Z

    .line 92
    const-string v0, "isSplitButton"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->getBoolean(Ljava/lang/String;)Z

    move-result v0

    iput-boolean v0, p0, Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsMessageContentParser;->splitButton:Z

    .line 94
    return-void
.end method
