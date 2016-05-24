.class public Lcom/adobe/creativesdk/foundation/internal/comments/models/AdobeAssetCommentData;
.super Ljava/lang/Object;
.source "AdobeAssetCommentData.java"


# instance fields
.field private avatarURL:Ljava/lang/String;

.field private commentURL:Ljava/lang/String;

.field private content:Ljava/lang/String;

.field private resourceURL:Ljava/lang/String;

.field private timeStamp:J

.field private userName:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;JLjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .registers 9
    .param p1, "userName"    # Ljava/lang/String;
    .param p2, "content"    # Ljava/lang/String;
    .param p3, "timeStamp"    # J
    .param p5, "avatarURL"    # Ljava/lang/String;
    .param p6, "commentURL"    # Ljava/lang/String;
    .param p7, "resourceURL"    # Ljava/lang/String;

    .prologue
    .line 14
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 15
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/comments/models/AdobeAssetCommentData;->userName:Ljava/lang/String;

    .line 16
    iput-object p2, p0, Lcom/adobe/creativesdk/foundation/internal/comments/models/AdobeAssetCommentData;->content:Ljava/lang/String;

    .line 17
    iput-object p5, p0, Lcom/adobe/creativesdk/foundation/internal/comments/models/AdobeAssetCommentData;->avatarURL:Ljava/lang/String;

    .line 18
    iput-object p6, p0, Lcom/adobe/creativesdk/foundation/internal/comments/models/AdobeAssetCommentData;->commentURL:Ljava/lang/String;

    .line 19
    iput-object p7, p0, Lcom/adobe/creativesdk/foundation/internal/comments/models/AdobeAssetCommentData;->resourceURL:Ljava/lang/String;

    .line 20
    iput-wide p3, p0, Lcom/adobe/creativesdk/foundation/internal/comments/models/AdobeAssetCommentData;->timeStamp:J

    .line 22
    return-void
.end method


# virtual methods
.method public getAvatarURL()Ljava/lang/String;
    .registers 2

    .prologue
    .line 33
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/comments/models/AdobeAssetCommentData;->avatarURL:Ljava/lang/String;

    return-object v0
.end method

.method public getComment()Ljava/lang/String;
    .registers 2

    .prologue
    .line 29
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/comments/models/AdobeAssetCommentData;->content:Ljava/lang/String;

    return-object v0
.end method

.method public getCommentURL()Ljava/lang/String;
    .registers 2

    .prologue
    .line 37
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/comments/models/AdobeAssetCommentData;->commentURL:Ljava/lang/String;

    return-object v0
.end method

.method public getTimeStamp()J
    .registers 3

    .prologue
    .line 45
    iget-wide v0, p0, Lcom/adobe/creativesdk/foundation/internal/comments/models/AdobeAssetCommentData;->timeStamp:J

    return-wide v0
.end method

.method public getUserName()Ljava/lang/String;
    .registers 2

    .prologue
    .line 25
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/comments/models/AdobeAssetCommentData;->userName:Ljava/lang/String;

    return-object v0
.end method
