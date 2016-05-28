.class Lcom/facebook/AppEventsLogger$AccessTokenAppIdPair;
.super Ljava/lang/Object;
.source "AppEventsLogger.java"

# interfaces
.implements Ljava/io/Serializable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/facebook/AppEventsLogger;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "AccessTokenAppIdPair"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/facebook/AppEventsLogger$AccessTokenAppIdPair$SerializationProxyV1;
    }
.end annotation


# static fields
.field private static final serialVersionUID:J = 0x1L


# instance fields
.field private final accessToken:Ljava/lang/String;

.field private final applicationId:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/facebook/Session;)V
    .registers 4
    .param p1, "session"    # Lcom/facebook/Session;

    .prologue
    .line 181
    invoke-virtual {p1}, Lcom/facebook/Session;->getAccessToken()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1}, Lcom/facebook/Session;->getApplicationId()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v0, v1}, Lcom/facebook/AppEventsLogger$AccessTokenAppIdPair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 182
    return-void
.end method

.method constructor <init>(Ljava/lang/String;Ljava/lang/String;)V
    .registers 4
    .param p1, "accessToken"    # Ljava/lang/String;
    .param p2, "applicationId"    # Ljava/lang/String;

    .prologue
    .line 184
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 185
    invoke-static {p1}, Lcom/facebook/internal/Utility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_a

    const/4 p1, 0x0

    .end local p1    # "accessToken":Ljava/lang/String;
    :cond_a
    iput-object p1, p0, Lcom/facebook/AppEventsLogger$AccessTokenAppIdPair;->accessToken:Ljava/lang/String;

    .line 186
    iput-object p2, p0, Lcom/facebook/AppEventsLogger$AccessTokenAppIdPair;->applicationId:Ljava/lang/String;

    .line 187
    return-void
.end method

.method private writeReplace()Ljava/lang/Object;
    .registers 5

    .prologue
    .line 229
    new-instance v0, Lcom/facebook/AppEventsLogger$AccessTokenAppIdPair$SerializationProxyV1;

    iget-object v1, p0, Lcom/facebook/AppEventsLogger$AccessTokenAppIdPair;->accessToken:Ljava/lang/String;

    iget-object v2, p0, Lcom/facebook/AppEventsLogger$AccessTokenAppIdPair;->applicationId:Ljava/lang/String;

    const/4 v3, 0x0

    invoke-direct {v0, v1, v2, v3}, Lcom/facebook/AppEventsLogger$AccessTokenAppIdPair$SerializationProxyV1;-><init>(Ljava/lang/String;Ljava/lang/String;Lcom/facebook/AppEventsLogger$AccessTokenAppIdPair$SerializationProxyV1;)V

    return-object v0
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .registers 6
    .param p1, "o"    # Ljava/lang/Object;

    .prologue
    const/4 v1, 0x0

    .line 205
    instance-of v2, p1, Lcom/facebook/AppEventsLogger$AccessTokenAppIdPair;

    if-nez v2, :cond_6

    .line 209
    :cond_5
    :goto_5
    return v1

    :cond_6
    move-object v0, p1

    .line 208
    check-cast v0, Lcom/facebook/AppEventsLogger$AccessTokenAppIdPair;

    .line 209
    .local v0, "p":Lcom/facebook/AppEventsLogger$AccessTokenAppIdPair;
    iget-object v2, v0, Lcom/facebook/AppEventsLogger$AccessTokenAppIdPair;->accessToken:Ljava/lang/String;

    iget-object v3, p0, Lcom/facebook/AppEventsLogger$AccessTokenAppIdPair;->accessToken:Ljava/lang/String;

    invoke-static {v2, v3}, Lcom/facebook/internal/Utility;->areObjectsEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_5

    .line 210
    iget-object v2, v0, Lcom/facebook/AppEventsLogger$AccessTokenAppIdPair;->applicationId:Ljava/lang/String;

    iget-object v3, p0, Lcom/facebook/AppEventsLogger$AccessTokenAppIdPair;->applicationId:Ljava/lang/String;

    invoke-static {v2, v3}, Lcom/facebook/internal/Utility;->areObjectsEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_5

    .line 209
    const/4 v1, 0x1

    goto :goto_5
.end method

.method getAccessToken()Ljava/lang/String;
    .registers 2

    .prologue
    .line 190
    iget-object v0, p0, Lcom/facebook/AppEventsLogger$AccessTokenAppIdPair;->accessToken:Ljava/lang/String;

    return-object v0
.end method

.method getApplicationId()Ljava/lang/String;
    .registers 2

    .prologue
    .line 194
    iget-object v0, p0, Lcom/facebook/AppEventsLogger$AccessTokenAppIdPair;->applicationId:Ljava/lang/String;

    return-object v0
.end method

.method public hashCode()I
    .registers 4

    .prologue
    const/4 v1, 0x0

    .line 199
    iget-object v0, p0, Lcom/facebook/AppEventsLogger$AccessTokenAppIdPair;->accessToken:Ljava/lang/String;

    if-nez v0, :cond_c

    move v0, v1

    .line 200
    :goto_6
    iget-object v2, p0, Lcom/facebook/AppEventsLogger$AccessTokenAppIdPair;->applicationId:Ljava/lang/String;

    if-nez v2, :cond_13

    .line 199
    :goto_a
    xor-int/2addr v0, v1

    return v0

    :cond_c
    iget-object v0, p0, Lcom/facebook/AppEventsLogger$AccessTokenAppIdPair;->accessToken:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v0

    goto :goto_6

    .line 200
    :cond_13
    iget-object v1, p0, Lcom/facebook/AppEventsLogger$AccessTokenAppIdPair;->applicationId:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v1

    goto :goto_a
.end method
