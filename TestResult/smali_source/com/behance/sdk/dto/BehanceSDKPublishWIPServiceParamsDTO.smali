.class public Lcom/behance/sdk/dto/BehanceSDKPublishWIPServiceParamsDTO;
.super Ljava/lang/Object;
.source "BehanceSDKPublishWIPServiceParamsDTO.java"

# interfaces
.implements Ljava/io/Serializable;


# static fields
.field private static final serialVersionUID:J = 0x60c6a86e0007b14dL


# instance fields
.field private appClientId:Ljava/lang/String;

.field private containsAdultContent:Z

.field private notificationHandlerActivity:Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/Class",
            "<+",
            "Landroid/app/Activity;",
            ">;"
        }
    .end annotation
.end field

.field private shareOnFacebook:Z

.field private shareOnTwitter:Z

.field private twitterConsumerKey:Ljava/lang/String;

.field private twitterConsumerSecret:Ljava/lang/String;

.field private twitterUserAccessToken:Ljava/lang/String;

.field private twitterUserAccessTokenSecret:Ljava/lang/String;

.field private wipDescription:Ljava/lang/String;

.field private wipId:I

.field private wipImageFile:Lcom/behance/sdk/project/modules/ProjectModule;

.field private wipTags:Ljava/lang/String;

.field private wipTitle:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 31
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getAppClientId()Ljava/lang/String;
    .registers 2

    .prologue
    .line 84
    iget-object v0, p0, Lcom/behance/sdk/dto/BehanceSDKPublishWIPServiceParamsDTO;->appClientId:Ljava/lang/String;

    return-object v0
.end method

.method public getNotificationHandlerActivity()Ljava/lang/Class;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/lang/Class",
            "<+",
            "Landroid/app/Activity;",
            ">;"
        }
    .end annotation

    .prologue
    .line 104
    iget-object v0, p0, Lcom/behance/sdk/dto/BehanceSDKPublishWIPServiceParamsDTO;->notificationHandlerActivity:Ljava/lang/Class;

    return-object v0
.end method

.method public getTwitterConsumerKey()Ljava/lang/String;
    .registers 2

    .prologue
    .line 144
    iget-object v0, p0, Lcom/behance/sdk/dto/BehanceSDKPublishWIPServiceParamsDTO;->twitterConsumerKey:Ljava/lang/String;

    return-object v0
.end method

.method public getTwitterConsumerSecret()Ljava/lang/String;
    .registers 2

    .prologue
    .line 152
    iget-object v0, p0, Lcom/behance/sdk/dto/BehanceSDKPublishWIPServiceParamsDTO;->twitterConsumerSecret:Ljava/lang/String;

    return-object v0
.end method

.method public getTwitterUserAccessToken()Ljava/lang/String;
    .registers 2

    .prologue
    .line 128
    iget-object v0, p0, Lcom/behance/sdk/dto/BehanceSDKPublishWIPServiceParamsDTO;->twitterUserAccessToken:Ljava/lang/String;

    return-object v0
.end method

.method public getTwitterUserAccessTokenSecret()Ljava/lang/String;
    .registers 2

    .prologue
    .line 136
    iget-object v0, p0, Lcom/behance/sdk/dto/BehanceSDKPublishWIPServiceParamsDTO;->twitterUserAccessTokenSecret:Ljava/lang/String;

    return-object v0
.end method

.method public getWipDescription()Ljava/lang/String;
    .registers 2

    .prologue
    .line 68
    iget-object v0, p0, Lcom/behance/sdk/dto/BehanceSDKPublishWIPServiceParamsDTO;->wipDescription:Ljava/lang/String;

    return-object v0
.end method

.method public getWipId()I
    .registers 2

    .prologue
    .line 60
    iget v0, p0, Lcom/behance/sdk/dto/BehanceSDKPublishWIPServiceParamsDTO;->wipId:I

    return v0
.end method

.method public getWipImageFile()Lcom/behance/sdk/project/modules/ProjectModule;
    .registers 2

    .prologue
    .line 96
    iget-object v0, p0, Lcom/behance/sdk/dto/BehanceSDKPublishWIPServiceParamsDTO;->wipImageFile:Lcom/behance/sdk/project/modules/ProjectModule;

    return-object v0
.end method

.method public getWipTags()Ljava/lang/String;
    .registers 2

    .prologue
    .line 76
    iget-object v0, p0, Lcom/behance/sdk/dto/BehanceSDKPublishWIPServiceParamsDTO;->wipTags:Ljava/lang/String;

    return-object v0
.end method

.method public getWipTitle()Ljava/lang/String;
    .registers 2

    .prologue
    .line 52
    iget-object v0, p0, Lcom/behance/sdk/dto/BehanceSDKPublishWIPServiceParamsDTO;->wipTitle:Ljava/lang/String;

    return-object v0
.end method

.method public isContainsAdultContent()Z
    .registers 2

    .prologue
    .line 160
    iget-boolean v0, p0, Lcom/behance/sdk/dto/BehanceSDKPublishWIPServiceParamsDTO;->containsAdultContent:Z

    return v0
.end method

.method public isShareOnFacebook()Z
    .registers 2

    .prologue
    .line 112
    iget-boolean v0, p0, Lcom/behance/sdk/dto/BehanceSDKPublishWIPServiceParamsDTO;->shareOnFacebook:Z

    return v0
.end method

.method public isShareOnTwitter()Z
    .registers 2

    .prologue
    .line 120
    iget-boolean v0, p0, Lcom/behance/sdk/dto/BehanceSDKPublishWIPServiceParamsDTO;->shareOnTwitter:Z

    return v0
.end method

.method public setAppClientId(Ljava/lang/String;)V
    .registers 2
    .param p1, "appClientId"    # Ljava/lang/String;

    .prologue
    .line 88
    iput-object p1, p0, Lcom/behance/sdk/dto/BehanceSDKPublishWIPServiceParamsDTO;->appClientId:Ljava/lang/String;

    .line 89
    return-void
.end method

.method public setContainsAdultContent(Z)V
    .registers 2
    .param p1, "containsAdultContent"    # Z

    .prologue
    .line 164
    iput-boolean p1, p0, Lcom/behance/sdk/dto/BehanceSDKPublishWIPServiceParamsDTO;->containsAdultContent:Z

    .line 165
    return-void
.end method

.method public setNotificationHandlerActivity(Ljava/lang/Class;)V
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<+",
            "Landroid/app/Activity;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 108
    .local p1, "notificationHandlerActivity":Ljava/lang/Class;, "Ljava/lang/Class<+Landroid/app/Activity;>;"
    iput-object p1, p0, Lcom/behance/sdk/dto/BehanceSDKPublishWIPServiceParamsDTO;->notificationHandlerActivity:Ljava/lang/Class;

    .line 109
    return-void
.end method

.method public setShareOnFacebook(Z)V
    .registers 2
    .param p1, "shareOnFacebook"    # Z

    .prologue
    .line 116
    iput-boolean p1, p0, Lcom/behance/sdk/dto/BehanceSDKPublishWIPServiceParamsDTO;->shareOnFacebook:Z

    .line 117
    return-void
.end method

.method public setShareOnTwitter(Z)V
    .registers 2
    .param p1, "shareOnTwitter"    # Z

    .prologue
    .line 124
    iput-boolean p1, p0, Lcom/behance/sdk/dto/BehanceSDKPublishWIPServiceParamsDTO;->shareOnTwitter:Z

    .line 125
    return-void
.end method

.method public setTwitterConsumerKey(Ljava/lang/String;)V
    .registers 2
    .param p1, "twitterConsumerKey"    # Ljava/lang/String;

    .prologue
    .line 148
    iput-object p1, p0, Lcom/behance/sdk/dto/BehanceSDKPublishWIPServiceParamsDTO;->twitterConsumerKey:Ljava/lang/String;

    .line 149
    return-void
.end method

.method public setTwitterConsumerSecret(Ljava/lang/String;)V
    .registers 2
    .param p1, "twitterConsumerSecret"    # Ljava/lang/String;

    .prologue
    .line 156
    iput-object p1, p0, Lcom/behance/sdk/dto/BehanceSDKPublishWIPServiceParamsDTO;->twitterConsumerSecret:Ljava/lang/String;

    .line 157
    return-void
.end method

.method public setTwitterUserAccessToken(Ljava/lang/String;)V
    .registers 2
    .param p1, "twitterUserAccessToken"    # Ljava/lang/String;

    .prologue
    .line 132
    iput-object p1, p0, Lcom/behance/sdk/dto/BehanceSDKPublishWIPServiceParamsDTO;->twitterUserAccessToken:Ljava/lang/String;

    .line 133
    return-void
.end method

.method public setTwitterUserAccessTokenSecret(Ljava/lang/String;)V
    .registers 2
    .param p1, "twitterUserAccessTokenSecret"    # Ljava/lang/String;

    .prologue
    .line 140
    iput-object p1, p0, Lcom/behance/sdk/dto/BehanceSDKPublishWIPServiceParamsDTO;->twitterUserAccessTokenSecret:Ljava/lang/String;

    .line 141
    return-void
.end method

.method public setWipDescription(Ljava/lang/String;)V
    .registers 2
    .param p1, "wipDescription"    # Ljava/lang/String;

    .prologue
    .line 72
    iput-object p1, p0, Lcom/behance/sdk/dto/BehanceSDKPublishWIPServiceParamsDTO;->wipDescription:Ljava/lang/String;

    .line 73
    return-void
.end method

.method public setWipId(I)V
    .registers 2
    .param p1, "wipId"    # I

    .prologue
    .line 64
    iput p1, p0, Lcom/behance/sdk/dto/BehanceSDKPublishWIPServiceParamsDTO;->wipId:I

    .line 65
    return-void
.end method

.method public setWipImageFile(Lcom/behance/sdk/project/modules/ProjectModule;)V
    .registers 2
    .param p1, "wipImageFile"    # Lcom/behance/sdk/project/modules/ProjectModule;

    .prologue
    .line 100
    iput-object p1, p0, Lcom/behance/sdk/dto/BehanceSDKPublishWIPServiceParamsDTO;->wipImageFile:Lcom/behance/sdk/project/modules/ProjectModule;

    .line 101
    return-void
.end method

.method public setWipTags(Ljava/lang/String;)V
    .registers 2
    .param p1, "wipTags"    # Ljava/lang/String;

    .prologue
    .line 80
    iput-object p1, p0, Lcom/behance/sdk/dto/BehanceSDKPublishWIPServiceParamsDTO;->wipTags:Ljava/lang/String;

    .line 81
    return-void
.end method

.method public setWipTitle(Ljava/lang/String;)V
    .registers 2
    .param p1, "wipTitle"    # Ljava/lang/String;

    .prologue
    .line 56
    iput-object p1, p0, Lcom/behance/sdk/dto/BehanceSDKPublishWIPServiceParamsDTO;->wipTitle:Ljava/lang/String;

    .line 57
    return-void
.end method
