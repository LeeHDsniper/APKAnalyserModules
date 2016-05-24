.class public Lcom/behance/sdk/OAuth/TwitterClient;
.super Ljava/lang/Object;
.source "TwitterClient.java"


# static fields
.field private static instance:Lcom/behance/sdk/OAuth/TwitterClient;


# instance fields
.field private mConsumer:Loauth/signpost/OAuthConsumer;

.field private mProvider:Loauth/signpost/commonshttp/CommonsHttpOAuthProvider;


# direct methods
.method private constructor <init>(Ljava/lang/String;Ljava/lang/String;)V
    .registers 3
    .param p1, "consumerToken"    # Ljava/lang/String;
    .param p2, "consumerSecret"    # Ljava/lang/String;

    .prologue
    .line 64
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 65
    invoke-direct {p0, p1, p2}, Lcom/behance/sdk/OAuth/TwitterClient;->initialize(Ljava/lang/String;Ljava/lang/String;)V

    .line 66
    return-void
.end method

.method public static getInstance(Ljava/lang/String;Ljava/lang/String;)Lcom/behance/sdk/OAuth/TwitterClient;
    .registers 3
    .param p0, "consumerToken"    # Ljava/lang/String;
    .param p1, "consumerSecret"    # Ljava/lang/String;

    .prologue
    .line 58
    sget-object v0, Lcom/behance/sdk/OAuth/TwitterClient;->instance:Lcom/behance/sdk/OAuth/TwitterClient;

    if-nez v0, :cond_b

    .line 59
    new-instance v0, Lcom/behance/sdk/OAuth/TwitterClient;

    invoke-direct {v0, p0, p1}, Lcom/behance/sdk/OAuth/TwitterClient;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    sput-object v0, Lcom/behance/sdk/OAuth/TwitterClient;->instance:Lcom/behance/sdk/OAuth/TwitterClient;

    .line 61
    :cond_b
    sget-object v0, Lcom/behance/sdk/OAuth/TwitterClient;->instance:Lcom/behance/sdk/OAuth/TwitterClient;

    return-object v0
.end method

.method private initialize(Ljava/lang/String;Ljava/lang/String;)V
    .registers 7
    .param p1, "consumerToken"    # Ljava/lang/String;
    .param p2, "consumerSecret"    # Ljava/lang/String;

    .prologue
    .line 69
    new-instance v0, Loauth/signpost/commonshttp/CommonsHttpOAuthProvider;

    const-string v1, "https://api.twitter.com/oauth/request_token"

    const-string v2, "https://api.twitter.com/oauth/access_token"

    const-string v3, "https://api.twitter.com/oauth/authorize"

    invoke-direct {v0, v1, v2, v3}, Loauth/signpost/commonshttp/CommonsHttpOAuthProvider;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    iput-object v0, p0, Lcom/behance/sdk/OAuth/TwitterClient;->mProvider:Loauth/signpost/commonshttp/CommonsHttpOAuthProvider;

    .line 70
    new-instance v0, Loauth/signpost/commonshttp/CommonsHttpOAuthConsumer;

    invoke-direct {v0, p1, p2}, Loauth/signpost/commonshttp/CommonsHttpOAuthConsumer;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    iput-object v0, p0, Lcom/behance/sdk/OAuth/TwitterClient;->mConsumer:Loauth/signpost/OAuthConsumer;

    .line 71
    return-void
.end method


# virtual methods
.method public getOAuthConsumer()Loauth/signpost/OAuthConsumer;
    .registers 2

    .prologue
    .line 78
    iget-object v0, p0, Lcom/behance/sdk/OAuth/TwitterClient;->mConsumer:Loauth/signpost/OAuthConsumer;

    return-object v0
.end method

.method public getOAuthProvider()Loauth/signpost/commonshttp/CommonsHttpOAuthProvider;
    .registers 2

    .prologue
    .line 74
    iget-object v0, p0, Lcom/behance/sdk/OAuth/TwitterClient;->mProvider:Loauth/signpost/commonshttp/CommonsHttpOAuthProvider;

    return-object v0
.end method
