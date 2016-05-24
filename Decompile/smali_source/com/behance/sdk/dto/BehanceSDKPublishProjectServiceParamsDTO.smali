.class public Lcom/behance/sdk/dto/BehanceSDKPublishProjectServiceParamsDTO;
.super Ljava/lang/Object;
.source "BehanceSDKPublishProjectServiceParamsDTO.java"

# interfaces
.implements Ljava/io/Serializable;


# static fields
.field private static final serialVersionUID:J = -0x1d685e8da7c62635L


# instance fields
.field private appClientId:Ljava/lang/String;

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

.field private projectContainsAdultContent:Z

.field private projectCopyright:Ljava/lang/String;

.field private projectCoverImageByteArray:[B

.field private projectCoverImageFileName:Ljava/lang/String;

.field private projectCreativeFields:Ljava/lang/String;

.field private projectDescription:Ljava/lang/String;

.field private projectModules:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/behance/sdk/project/modules/ProjectModule;",
            ">;"
        }
    .end annotation
.end field

.field private projectTags:Ljava/lang/String;

.field private projectTitle:Ljava/lang/String;

.field private shareOnFacebook:Z

.field private shareOnTwitter:Z

.field private twitterConsumerKey:Ljava/lang/String;

.field private twitterConsumerSecret:Ljava/lang/String;

.field private twitterUserAccessToken:Ljava/lang/String;

.field private twitterUserAccessTokenSecret:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 33
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getAppClientId()Ljava/lang/String;
    .registers 2

    .prologue
    .line 57
    iget-object v0, p0, Lcom/behance/sdk/dto/BehanceSDKPublishProjectServiceParamsDTO;->appClientId:Ljava/lang/String;

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
    .line 65
    iget-object v0, p0, Lcom/behance/sdk/dto/BehanceSDKPublishProjectServiceParamsDTO;->notificationHandlerActivity:Ljava/lang/Class;

    return-object v0
.end method

.method public getProjectCopyright()Ljava/lang/String;
    .registers 2

    .prologue
    .line 113
    iget-object v0, p0, Lcom/behance/sdk/dto/BehanceSDKPublishProjectServiceParamsDTO;->projectCopyright:Ljava/lang/String;

    return-object v0
.end method

.method public getProjectCoverImageByteArray()[B
    .registers 2

    .prologue
    .line 129
    iget-object v0, p0, Lcom/behance/sdk/dto/BehanceSDKPublishProjectServiceParamsDTO;->projectCoverImageByteArray:[B

    return-object v0
.end method

.method public getProjectCoverImageFileName()Ljava/lang/String;
    .registers 2

    .prologue
    .line 137
    iget-object v0, p0, Lcom/behance/sdk/dto/BehanceSDKPublishProjectServiceParamsDTO;->projectCoverImageFileName:Ljava/lang/String;

    return-object v0
.end method

.method public getProjectCreativeFields()Ljava/lang/String;
    .registers 2

    .prologue
    .line 89
    iget-object v0, p0, Lcom/behance/sdk/dto/BehanceSDKPublishProjectServiceParamsDTO;->projectCreativeFields:Ljava/lang/String;

    return-object v0
.end method

.method public getProjectDescription()Ljava/lang/String;
    .registers 2

    .prologue
    .line 105
    iget-object v0, p0, Lcom/behance/sdk/dto/BehanceSDKPublishProjectServiceParamsDTO;->projectDescription:Ljava/lang/String;

    return-object v0
.end method

.method public getProjectModules()Ljava/util/List;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lcom/behance/sdk/project/modules/ProjectModule;",
            ">;"
        }
    .end annotation

    .prologue
    .line 73
    iget-object v0, p0, Lcom/behance/sdk/dto/BehanceSDKPublishProjectServiceParamsDTO;->projectModules:Ljava/util/List;

    return-object v0
.end method

.method public getProjectTags()Ljava/lang/String;
    .registers 2

    .prologue
    .line 97
    iget-object v0, p0, Lcom/behance/sdk/dto/BehanceSDKPublishProjectServiceParamsDTO;->projectTags:Ljava/lang/String;

    return-object v0
.end method

.method public getProjectTitle()Ljava/lang/String;
    .registers 2

    .prologue
    .line 81
    iget-object v0, p0, Lcom/behance/sdk/dto/BehanceSDKPublishProjectServiceParamsDTO;->projectTitle:Ljava/lang/String;

    return-object v0
.end method

.method public getTwitterConsumerKey()Ljava/lang/String;
    .registers 2

    .prologue
    .line 161
    iget-object v0, p0, Lcom/behance/sdk/dto/BehanceSDKPublishProjectServiceParamsDTO;->twitterConsumerKey:Ljava/lang/String;

    return-object v0
.end method

.method public getTwitterConsumerSecret()Ljava/lang/String;
    .registers 2

    .prologue
    .line 169
    iget-object v0, p0, Lcom/behance/sdk/dto/BehanceSDKPublishProjectServiceParamsDTO;->twitterConsumerSecret:Ljava/lang/String;

    return-object v0
.end method

.method public getTwitterUserAccessToken()Ljava/lang/String;
    .registers 2

    .prologue
    .line 145
    iget-object v0, p0, Lcom/behance/sdk/dto/BehanceSDKPublishProjectServiceParamsDTO;->twitterUserAccessToken:Ljava/lang/String;

    return-object v0
.end method

.method public getTwitterUserAccessTokenSecret()Ljava/lang/String;
    .registers 2

    .prologue
    .line 153
    iget-object v0, p0, Lcom/behance/sdk/dto/BehanceSDKPublishProjectServiceParamsDTO;->twitterUserAccessTokenSecret:Ljava/lang/String;

    return-object v0
.end method

.method public isProjectContainsAdultContent()Z
    .registers 2

    .prologue
    .line 121
    iget-boolean v0, p0, Lcom/behance/sdk/dto/BehanceSDKPublishProjectServiceParamsDTO;->projectContainsAdultContent:Z

    return v0
.end method

.method public isShareOnFacebook()Z
    .registers 2

    .prologue
    .line 177
    iget-boolean v0, p0, Lcom/behance/sdk/dto/BehanceSDKPublishProjectServiceParamsDTO;->shareOnFacebook:Z

    return v0
.end method

.method public isShareOnTwitter()Z
    .registers 2

    .prologue
    .line 185
    iget-boolean v0, p0, Lcom/behance/sdk/dto/BehanceSDKPublishProjectServiceParamsDTO;->shareOnTwitter:Z

    return v0
.end method

.method public setAppClientId(Ljava/lang/String;)V
    .registers 2
    .param p1, "appClientId"    # Ljava/lang/String;

    .prologue
    .line 61
    iput-object p1, p0, Lcom/behance/sdk/dto/BehanceSDKPublishProjectServiceParamsDTO;->appClientId:Ljava/lang/String;

    .line 62
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
    .line 69
    .local p1, "notificationHandlerActivity":Ljava/lang/Class;, "Ljava/lang/Class<+Landroid/app/Activity;>;"
    iput-object p1, p0, Lcom/behance/sdk/dto/BehanceSDKPublishProjectServiceParamsDTO;->notificationHandlerActivity:Ljava/lang/Class;

    .line 70
    return-void
.end method

.method public setProjectContainsAdultContent(Z)V
    .registers 2
    .param p1, "projectContainsAdultContent"    # Z

    .prologue
    .line 125
    iput-boolean p1, p0, Lcom/behance/sdk/dto/BehanceSDKPublishProjectServiceParamsDTO;->projectContainsAdultContent:Z

    .line 126
    return-void
.end method

.method public setProjectCopyright(Ljava/lang/String;)V
    .registers 2
    .param p1, "projectCopyright"    # Ljava/lang/String;

    .prologue
    .line 117
    iput-object p1, p0, Lcom/behance/sdk/dto/BehanceSDKPublishProjectServiceParamsDTO;->projectCopyright:Ljava/lang/String;

    .line 118
    return-void
.end method

.method public setProjectCoverImageByteArray([B)V
    .registers 2
    .param p1, "projectCoverImageByteArray"    # [B

    .prologue
    .line 133
    iput-object p1, p0, Lcom/behance/sdk/dto/BehanceSDKPublishProjectServiceParamsDTO;->projectCoverImageByteArray:[B

    .line 134
    return-void
.end method

.method public setProjectCoverImageFileName(Ljava/lang/String;)V
    .registers 2
    .param p1, "projectCoverImageFileName"    # Ljava/lang/String;

    .prologue
    .line 141
    iput-object p1, p0, Lcom/behance/sdk/dto/BehanceSDKPublishProjectServiceParamsDTO;->projectCoverImageFileName:Ljava/lang/String;

    .line 142
    return-void
.end method

.method public setProjectCreativeFields(Ljava/lang/String;)V
    .registers 2
    .param p1, "projectCreativeFields"    # Ljava/lang/String;

    .prologue
    .line 93
    iput-object p1, p0, Lcom/behance/sdk/dto/BehanceSDKPublishProjectServiceParamsDTO;->projectCreativeFields:Ljava/lang/String;

    .line 94
    return-void
.end method

.method public setProjectDescription(Ljava/lang/String;)V
    .registers 2
    .param p1, "projectDescription"    # Ljava/lang/String;

    .prologue
    .line 109
    iput-object p1, p0, Lcom/behance/sdk/dto/BehanceSDKPublishProjectServiceParamsDTO;->projectDescription:Ljava/lang/String;

    .line 110
    return-void
.end method

.method public setProjectModules(Ljava/util/List;)V
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/behance/sdk/project/modules/ProjectModule;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 77
    .local p1, "projectModules":Ljava/util/List;, "Ljava/util/List<Lcom/behance/sdk/project/modules/ProjectModule;>;"
    iput-object p1, p0, Lcom/behance/sdk/dto/BehanceSDKPublishProjectServiceParamsDTO;->projectModules:Ljava/util/List;

    .line 78
    return-void
.end method

.method public setProjectTags(Ljava/lang/String;)V
    .registers 2
    .param p1, "projectTags"    # Ljava/lang/String;

    .prologue
    .line 101
    iput-object p1, p0, Lcom/behance/sdk/dto/BehanceSDKPublishProjectServiceParamsDTO;->projectTags:Ljava/lang/String;

    .line 102
    return-void
.end method

.method public setProjectTitle(Ljava/lang/String;)V
    .registers 2
    .param p1, "projectTitle"    # Ljava/lang/String;

    .prologue
    .line 85
    iput-object p1, p0, Lcom/behance/sdk/dto/BehanceSDKPublishProjectServiceParamsDTO;->projectTitle:Ljava/lang/String;

    .line 86
    return-void
.end method

.method public setShareOnFacebook(Z)V
    .registers 2
    .param p1, "shareOnFacebook"    # Z

    .prologue
    .line 181
    iput-boolean p1, p0, Lcom/behance/sdk/dto/BehanceSDKPublishProjectServiceParamsDTO;->shareOnFacebook:Z

    .line 182
    return-void
.end method

.method public setShareOnTwitter(Z)V
    .registers 2
    .param p1, "shareOnTwitter"    # Z

    .prologue
    .line 189
    iput-boolean p1, p0, Lcom/behance/sdk/dto/BehanceSDKPublishProjectServiceParamsDTO;->shareOnTwitter:Z

    .line 190
    return-void
.end method

.method public setTwitterConsumerKey(Ljava/lang/String;)V
    .registers 2
    .param p1, "twitterConsumerKey"    # Ljava/lang/String;

    .prologue
    .line 165
    iput-object p1, p0, Lcom/behance/sdk/dto/BehanceSDKPublishProjectServiceParamsDTO;->twitterConsumerKey:Ljava/lang/String;

    .line 166
    return-void
.end method

.method public setTwitterConsumerSecret(Ljava/lang/String;)V
    .registers 2
    .param p1, "twitterConsumerSecret"    # Ljava/lang/String;

    .prologue
    .line 173
    iput-object p1, p0, Lcom/behance/sdk/dto/BehanceSDKPublishProjectServiceParamsDTO;->twitterConsumerSecret:Ljava/lang/String;

    .line 174
    return-void
.end method

.method public setTwitterUserAccessToken(Ljava/lang/String;)V
    .registers 2
    .param p1, "twitterUserAccessToken"    # Ljava/lang/String;

    .prologue
    .line 149
    iput-object p1, p0, Lcom/behance/sdk/dto/BehanceSDKPublishProjectServiceParamsDTO;->twitterUserAccessToken:Ljava/lang/String;

    .line 150
    return-void
.end method

.method public setTwitterUserAccessTokenSecret(Ljava/lang/String;)V
    .registers 2
    .param p1, "twitterUserAccessTokenSecret"    # Ljava/lang/String;

    .prologue
    .line 157
    iput-object p1, p0, Lcom/behance/sdk/dto/BehanceSDKPublishProjectServiceParamsDTO;->twitterUserAccessTokenSecret:Ljava/lang/String;

    .line 158
    return-void
.end method
