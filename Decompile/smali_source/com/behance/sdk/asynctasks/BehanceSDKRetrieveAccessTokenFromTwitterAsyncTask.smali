.class public Lcom/behance/sdk/asynctasks/BehanceSDKRetrieveAccessTokenFromTwitterAsyncTask;
.super Landroid/os/AsyncTask;
.source "BehanceSDKRetrieveAccessTokenFromTwitterAsyncTask.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/os/AsyncTask",
        "<",
        "Lcom/behance/sdk/asynctask/params/BehanceSDKRetrieveAccessTokenFromTwitterAsyncTaskParams;",
        "Ljava/lang/Void;",
        "Lcom/behance/sdk/asynctasks/result/BehanceSDKRetrieveAccessTokenFromTwitterTaskResult;",
        ">;"
    }
.end annotation


# static fields
.field private static final logger:Lcom/behance/sdk/logger/ILogger;


# instance fields
.field private consumer:Loauth/signpost/OAuthConsumer;

.field private consumerSecret:Ljava/lang/String;

.field private consumerToken:Ljava/lang/String;

.field private listener:Lcom/behance/sdk/asynctask/listeners/IBehanceSDKRetrieveAccessTokenFromTwitterTaskListener;

.field private provider:Loauth/signpost/commonshttp/CommonsHttpOAuthProvider;

.field private result:Lcom/behance/sdk/asynctasks/result/BehanceSDKRetrieveAccessTokenFromTwitterTaskResult;

.field private socialAccountDTO:Lcom/behance/sdk/dto/BehanceSDKSocialAccountDTO;

.field private socialAccountManager:Lcom/behance/sdk/BehanceSDKSocialAccountManager;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 56
    const-class v0, Lcom/behance/sdk/services/BehanceSDKPublishWIPService;

    invoke-static {v0}, Lcom/behance/sdk/logger/LoggerFactory;->getLogger(Ljava/lang/Class;)Lcom/behance/sdk/logger/ILogger;

    move-result-object v0

    sput-object v0, Lcom/behance/sdk/asynctasks/BehanceSDKRetrieveAccessTokenFromTwitterAsyncTask;->logger:Lcom/behance/sdk/logger/ILogger;

    return-void
.end method

.method public constructor <init>(Lcom/behance/sdk/asynctask/listeners/IBehanceSDKRetrieveAccessTokenFromTwitterTaskListener;Landroid/content/Context;)V
    .registers 5
    .param p1, "listener"    # Lcom/behance/sdk/asynctask/listeners/IBehanceSDKRetrieveAccessTokenFromTwitterTaskListener;
    .param p2, "context"    # Landroid/content/Context;

    .prologue
    .line 66
    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    .line 67
    iput-object p1, p0, Lcom/behance/sdk/asynctasks/BehanceSDKRetrieveAccessTokenFromTwitterAsyncTask;->listener:Lcom/behance/sdk/asynctask/listeners/IBehanceSDKRetrieveAccessTokenFromTwitterTaskListener;

    .line 68
    invoke-static {p2}, Lcom/behance/sdk/BehanceSDKSocialAccountManager;->getInstance(Landroid/content/Context;)Lcom/behance/sdk/BehanceSDKSocialAccountManager;

    move-result-object v0

    iput-object v0, p0, Lcom/behance/sdk/asynctasks/BehanceSDKRetrieveAccessTokenFromTwitterAsyncTask;->socialAccountManager:Lcom/behance/sdk/BehanceSDKSocialAccountManager;

    .line 69
    iget-object v0, p0, Lcom/behance/sdk/asynctasks/BehanceSDKRetrieveAccessTokenFromTwitterAsyncTask;->socialAccountManager:Lcom/behance/sdk/BehanceSDKSocialAccountManager;

    sget-object v1, Lcom/behance/sdk/enums/BehanceSDKSocialAccountType;->TWITTER:Lcom/behance/sdk/enums/BehanceSDKSocialAccountType;

    invoke-virtual {v0, v1}, Lcom/behance/sdk/BehanceSDKSocialAccountManager;->getAccount(Lcom/behance/sdk/enums/BehanceSDKSocialAccountType;)Lcom/behance/sdk/dto/BehanceSDKSocialAccountDTO;

    move-result-object v0

    iput-object v0, p0, Lcom/behance/sdk/asynctasks/BehanceSDKRetrieveAccessTokenFromTwitterAsyncTask;->socialAccountDTO:Lcom/behance/sdk/dto/BehanceSDKSocialAccountDTO;

    .line 71
    return-void
.end method

.method private retrieveAccessTokenFromTwitter(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .registers 11
    .param p1, "url"    # Ljava/lang/String;
    .param p2, "consumerToken"    # Ljava/lang/String;
    .param p3, "consumerSecret"    # Ljava/lang/String;

    .prologue
    const/4 v6, 0x1

    .line 126
    if-eqz p1, :cond_25

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v3

    if-lez v3, :cond_25

    .line 127
    invoke-static {p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    .line 128
    .local v0, "authUri":Landroid/net/Uri;
    const-string v3, "oauth_verifier"

    invoke-virtual {v0, v3}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 129
    .local v2, "oauth_verifier":Ljava/lang/String;
    if-eqz v2, :cond_25

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v3

    if-lez v3, :cond_25

    .line 132
    :try_start_1b
    iget-object v3, p0, Lcom/behance/sdk/asynctasks/BehanceSDKRetrieveAccessTokenFromTwitterAsyncTask;->provider:Loauth/signpost/commonshttp/CommonsHttpOAuthProvider;

    iget-object v4, p0, Lcom/behance/sdk/asynctasks/BehanceSDKRetrieveAccessTokenFromTwitterAsyncTask;->consumer:Loauth/signpost/OAuthConsumer;

    const/4 v5, 0x0

    new-array v5, v5, [Ljava/lang/String;

    invoke-virtual {v3, v4, v2, v5}, Loauth/signpost/commonshttp/CommonsHttpOAuthProvider;->retrieveAccessToken(Loauth/signpost/OAuthConsumer;Ljava/lang/String;[Ljava/lang/String;)V
    :try_end_25
    .catch Loauth/signpost/exception/OAuthMessageSignerException; {:try_start_1b .. :try_end_25} :catch_26
    .catch Loauth/signpost/exception/OAuthNotAuthorizedException; {:try_start_1b .. :try_end_25} :catch_32
    .catch Loauth/signpost/exception/OAuthExpectationFailedException; {:try_start_1b .. :try_end_25} :catch_3e
    .catch Loauth/signpost/exception/OAuthCommunicationException; {:try_start_1b .. :try_end_25} :catch_4a
    .catch Ljava/lang/Exception; {:try_start_1b .. :try_end_25} :catch_56

    .line 151
    .end local v0    # "authUri":Landroid/net/Uri;
    .end local v2    # "oauth_verifier":Ljava/lang/String;
    :cond_25
    :goto_25
    return-void

    .line 133
    .restart local v0    # "authUri":Landroid/net/Uri;
    .restart local v2    # "oauth_verifier":Ljava/lang/String;
    :catch_26
    move-exception v1

    .line 134
    .local v1, "e":Loauth/signpost/exception/OAuthMessageSignerException;
    iget-object v3, p0, Lcom/behance/sdk/asynctasks/BehanceSDKRetrieveAccessTokenFromTwitterAsyncTask;->result:Lcom/behance/sdk/asynctasks/result/BehanceSDKRetrieveAccessTokenFromTwitterTaskResult;

    invoke-virtual {v3, v6}, Lcom/behance/sdk/asynctasks/result/BehanceSDKRetrieveAccessTokenFromTwitterTaskResult;->setExceptionOccurred(Z)V

    .line 135
    iget-object v3, p0, Lcom/behance/sdk/asynctasks/BehanceSDKRetrieveAccessTokenFromTwitterAsyncTask;->result:Lcom/behance/sdk/asynctasks/result/BehanceSDKRetrieveAccessTokenFromTwitterTaskResult;

    invoke-virtual {v3, v1}, Lcom/behance/sdk/asynctasks/result/BehanceSDKRetrieveAccessTokenFromTwitterTaskResult;->setException(Ljava/lang/Exception;)V

    goto :goto_25

    .line 136
    .end local v1    # "e":Loauth/signpost/exception/OAuthMessageSignerException;
    :catch_32
    move-exception v1

    .line 137
    .local v1, "e":Loauth/signpost/exception/OAuthNotAuthorizedException;
    iget-object v3, p0, Lcom/behance/sdk/asynctasks/BehanceSDKRetrieveAccessTokenFromTwitterAsyncTask;->result:Lcom/behance/sdk/asynctasks/result/BehanceSDKRetrieveAccessTokenFromTwitterTaskResult;

    invoke-virtual {v3, v6}, Lcom/behance/sdk/asynctasks/result/BehanceSDKRetrieveAccessTokenFromTwitterTaskResult;->setExceptionOccurred(Z)V

    .line 138
    iget-object v3, p0, Lcom/behance/sdk/asynctasks/BehanceSDKRetrieveAccessTokenFromTwitterAsyncTask;->result:Lcom/behance/sdk/asynctasks/result/BehanceSDKRetrieveAccessTokenFromTwitterTaskResult;

    invoke-virtual {v3, v1}, Lcom/behance/sdk/asynctasks/result/BehanceSDKRetrieveAccessTokenFromTwitterTaskResult;->setException(Ljava/lang/Exception;)V

    goto :goto_25

    .line 139
    .end local v1    # "e":Loauth/signpost/exception/OAuthNotAuthorizedException;
    :catch_3e
    move-exception v1

    .line 140
    .local v1, "e":Loauth/signpost/exception/OAuthExpectationFailedException;
    iget-object v3, p0, Lcom/behance/sdk/asynctasks/BehanceSDKRetrieveAccessTokenFromTwitterAsyncTask;->result:Lcom/behance/sdk/asynctasks/result/BehanceSDKRetrieveAccessTokenFromTwitterTaskResult;

    invoke-virtual {v3, v6}, Lcom/behance/sdk/asynctasks/result/BehanceSDKRetrieveAccessTokenFromTwitterTaskResult;->setExceptionOccurred(Z)V

    .line 141
    iget-object v3, p0, Lcom/behance/sdk/asynctasks/BehanceSDKRetrieveAccessTokenFromTwitterAsyncTask;->result:Lcom/behance/sdk/asynctasks/result/BehanceSDKRetrieveAccessTokenFromTwitterTaskResult;

    invoke-virtual {v3, v1}, Lcom/behance/sdk/asynctasks/result/BehanceSDKRetrieveAccessTokenFromTwitterTaskResult;->setException(Ljava/lang/Exception;)V

    goto :goto_25

    .line 142
    .end local v1    # "e":Loauth/signpost/exception/OAuthExpectationFailedException;
    :catch_4a
    move-exception v1

    .line 143
    .local v1, "e":Loauth/signpost/exception/OAuthCommunicationException;
    iget-object v3, p0, Lcom/behance/sdk/asynctasks/BehanceSDKRetrieveAccessTokenFromTwitterAsyncTask;->result:Lcom/behance/sdk/asynctasks/result/BehanceSDKRetrieveAccessTokenFromTwitterTaskResult;

    invoke-virtual {v3, v6}, Lcom/behance/sdk/asynctasks/result/BehanceSDKRetrieveAccessTokenFromTwitterTaskResult;->setExceptionOccurred(Z)V

    .line 144
    iget-object v3, p0, Lcom/behance/sdk/asynctasks/BehanceSDKRetrieveAccessTokenFromTwitterAsyncTask;->result:Lcom/behance/sdk/asynctasks/result/BehanceSDKRetrieveAccessTokenFromTwitterTaskResult;

    invoke-virtual {v3, v1}, Lcom/behance/sdk/asynctasks/result/BehanceSDKRetrieveAccessTokenFromTwitterTaskResult;->setException(Ljava/lang/Exception;)V

    goto :goto_25

    .line 145
    .end local v1    # "e":Loauth/signpost/exception/OAuthCommunicationException;
    :catch_56
    move-exception v1

    .line 146
    .local v1, "e":Ljava/lang/Exception;
    iget-object v3, p0, Lcom/behance/sdk/asynctasks/BehanceSDKRetrieveAccessTokenFromTwitterAsyncTask;->result:Lcom/behance/sdk/asynctasks/result/BehanceSDKRetrieveAccessTokenFromTwitterTaskResult;

    invoke-virtual {v3, v6}, Lcom/behance/sdk/asynctasks/result/BehanceSDKRetrieveAccessTokenFromTwitterTaskResult;->setExceptionOccurred(Z)V

    .line 147
    iget-object v3, p0, Lcom/behance/sdk/asynctasks/BehanceSDKRetrieveAccessTokenFromTwitterAsyncTask;->result:Lcom/behance/sdk/asynctasks/result/BehanceSDKRetrieveAccessTokenFromTwitterTaskResult;

    invoke-virtual {v3, v1}, Lcom/behance/sdk/asynctasks/result/BehanceSDKRetrieveAccessTokenFromTwitterTaskResult;->setException(Ljava/lang/Exception;)V

    goto :goto_25
.end method

.method private retrieveUserNameFromTwitter()Ljava/lang/String;
    .registers 16

    .prologue
    const/4 v14, 0x0

    .line 100
    const/4 v8, 0x0

    .line 103
    .local v8, "userName":Ljava/lang/String;
    :try_start_2
    new-instance v7, Ljava/net/URI;

    const-string v9, "https://api.twitter.com/1.1/account/settings.json"

    invoke-direct {v7, v9}, Ljava/net/URI;-><init>(Ljava/lang/String;)V

    .line 104
    .local v7, "updateURI":Ljava/net/URI;
    new-instance v4, Lorg/apache/http/client/methods/HttpPost;

    invoke-direct {v4, v7}, Lorg/apache/http/client/methods/HttpPost;-><init>(Ljava/net/URI;)V

    .line 105
    .local v4, "request":Lorg/apache/http/client/methods/HttpPost;
    iget-object v9, p0, Lcom/behance/sdk/asynctasks/BehanceSDKRetrieveAccessTokenFromTwitterAsyncTask;->consumer:Loauth/signpost/OAuthConsumer;

    invoke-interface {v9, v4}, Loauth/signpost/OAuthConsumer;->sign(Ljava/lang/Object;)Loauth/signpost/http/HttpRequest;

    .line 107
    new-instance v0, Lorg/apache/http/impl/client/DefaultHttpClient;

    invoke-direct {v0}, Lorg/apache/http/impl/client/DefaultHttpClient;-><init>()V

    .line 108
    .local v0, "client":Lorg/apache/http/client/HttpClient;
    invoke-interface {v0, v4}, Lorg/apache/http/client/HttpClient;->execute(Lorg/apache/http/client/methods/HttpUriRequest;)Lorg/apache/http/HttpResponse;

    move-result-object v5

    .line 109
    .local v5, "response":Lorg/apache/http/HttpResponse;
    invoke-interface {v5}, Lorg/apache/http/HttpResponse;->getEntity()Lorg/apache/http/HttpEntity;

    move-result-object v9

    invoke-static {v9}, Lorg/apache/http/util/EntityUtils;->toString(Lorg/apache/http/HttpEntity;)Ljava/lang/String;

    move-result-object v3

    .line 111
    .local v3, "jsonResponseString":Ljava/lang/String;
    invoke-interface {v5}, Lorg/apache/http/HttpResponse;->getStatusLine()Lorg/apache/http/StatusLine;

    move-result-object v9

    invoke-interface {v9}, Lorg/apache/http/StatusLine;->getStatusCode()I

    move-result v6

    .line 112
    .local v6, "statusCode":I
    const/16 v9, 0xc8

    if-ne v6, v9, :cond_3c

    .line 113
    new-instance v2, Lorg/json/JSONObject;

    invoke-direct {v2, v3}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 114
    .local v2, "jsonObject":Lorg/json/JSONObject;
    const-string v9, "screen_name"

    invoke-virtual {v2, v9}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    .line 122
    .end local v0    # "client":Lorg/apache/http/client/HttpClient;
    .end local v2    # "jsonObject":Lorg/json/JSONObject;
    .end local v3    # "jsonResponseString":Ljava/lang/String;
    .end local v4    # "request":Lorg/apache/http/client/methods/HttpPost;
    .end local v5    # "response":Lorg/apache/http/HttpResponse;
    .end local v6    # "statusCode":I
    .end local v7    # "updateURI":Ljava/net/URI;
    :goto_3b
    return-object v8

    .line 116
    .restart local v0    # "client":Lorg/apache/http/client/HttpClient;
    .restart local v3    # "jsonResponseString":Ljava/lang/String;
    .restart local v4    # "request":Lorg/apache/http/client/methods/HttpPost;
    .restart local v5    # "response":Lorg/apache/http/HttpResponse;
    .restart local v6    # "statusCode":I
    .restart local v7    # "updateURI":Ljava/net/URI;
    :cond_3c
    sget-object v9, Lcom/behance/sdk/asynctasks/BehanceSDKRetrieveAccessTokenFromTwitterAsyncTask;->logger:Lcom/behance/sdk/logger/ILogger;

    const-string v10, "Unexpected return code while retrieving user name from twitter. [return code - %s]"

    const/4 v11, 0x1

    new-array v11, v11, [Ljava/lang/Object;

    const/4 v12, 0x0

    invoke-interface {v5}, Lorg/apache/http/HttpResponse;->getStatusLine()Lorg/apache/http/StatusLine;

    move-result-object v13

    .line 117
    invoke-interface {v13}, Lorg/apache/http/StatusLine;->getStatusCode()I

    move-result v13

    .line 116
    invoke-static {v13}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v13

    aput-object v13, v11, v12

    invoke-interface {v9, v10, v11}, Lcom/behance/sdk/logger/ILogger;->error(Ljava/lang/String;[Ljava/lang/Object;)V
    :try_end_55
    .catch Ljava/lang/Throwable; {:try_start_2 .. :try_end_55} :catch_56

    goto :goto_3b

    .line 119
    .end local v0    # "client":Lorg/apache/http/client/HttpClient;
    .end local v3    # "jsonResponseString":Ljava/lang/String;
    .end local v4    # "request":Lorg/apache/http/client/methods/HttpPost;
    .end local v5    # "response":Lorg/apache/http/HttpResponse;
    .end local v6    # "statusCode":I
    .end local v7    # "updateURI":Ljava/net/URI;
    :catch_56
    move-exception v1

    .line 120
    .local v1, "e":Ljava/lang/Throwable;
    sget-object v9, Lcom/behance/sdk/asynctasks/BehanceSDKRetrieveAccessTokenFromTwitterAsyncTask;->logger:Lcom/behance/sdk/logger/ILogger;

    const-string v10, "Problem retrieving user name"

    new-array v11, v14, [Ljava/lang/Object;

    invoke-interface {v9, v1, v10, v11}, Lcom/behance/sdk/logger/ILogger;->error(Ljava/lang/Throwable;Ljava/lang/String;[Ljava/lang/Object;)V

    goto :goto_3b
.end method


# virtual methods
.method protected varargs doInBackground([Lcom/behance/sdk/asynctask/params/BehanceSDKRetrieveAccessTokenFromTwitterAsyncTaskParams;)Lcom/behance/sdk/asynctasks/result/BehanceSDKRetrieveAccessTokenFromTwitterTaskResult;
    .registers 8
    .param p1, "params"    # [Lcom/behance/sdk/asynctask/params/BehanceSDKRetrieveAccessTokenFromTwitterAsyncTaskParams;

    .prologue
    .line 75
    new-instance v3, Lcom/behance/sdk/asynctasks/result/BehanceSDKRetrieveAccessTokenFromTwitterTaskResult;

    invoke-direct {v3}, Lcom/behance/sdk/asynctasks/result/BehanceSDKRetrieveAccessTokenFromTwitterTaskResult;-><init>()V

    iput-object v3, p0, Lcom/behance/sdk/asynctasks/BehanceSDKRetrieveAccessTokenFromTwitterAsyncTask;->result:Lcom/behance/sdk/asynctasks/result/BehanceSDKRetrieveAccessTokenFromTwitterTaskResult;

    .line 76
    const/4 v3, 0x0

    aget-object v0, p1, v3

    .line 77
    .local v0, "taskParams":Lcom/behance/sdk/asynctask/params/BehanceSDKRetrieveAccessTokenFromTwitterAsyncTaskParams;
    invoke-virtual {v0}, Lcom/behance/sdk/asynctask/params/BehanceSDKRetrieveAccessTokenFromTwitterAsyncTaskParams;->getAuthURL()Ljava/lang/String;

    move-result-object v1

    .line 78
    .local v1, "url":Ljava/lang/String;
    invoke-virtual {v0}, Lcom/behance/sdk/asynctask/params/BehanceSDKRetrieveAccessTokenFromTwitterAsyncTaskParams;->getConsumerKey()Ljava/lang/String;

    move-result-object v3

    iput-object v3, p0, Lcom/behance/sdk/asynctasks/BehanceSDKRetrieveAccessTokenFromTwitterAsyncTask;->consumerToken:Ljava/lang/String;

    .line 79
    invoke-virtual {v0}, Lcom/behance/sdk/asynctask/params/BehanceSDKRetrieveAccessTokenFromTwitterAsyncTaskParams;->getConsumerSecret()Ljava/lang/String;

    move-result-object v3

    iput-object v3, p0, Lcom/behance/sdk/asynctasks/BehanceSDKRetrieveAccessTokenFromTwitterAsyncTask;->consumerSecret:Ljava/lang/String;

    .line 80
    iget-object v3, p0, Lcom/behance/sdk/asynctasks/BehanceSDKRetrieveAccessTokenFromTwitterAsyncTask;->consumerToken:Ljava/lang/String;

    iget-object v4, p0, Lcom/behance/sdk/asynctasks/BehanceSDKRetrieveAccessTokenFromTwitterAsyncTask;->consumerSecret:Ljava/lang/String;

    invoke-static {v3, v4}, Lcom/behance/sdk/OAuth/TwitterClient;->getInstance(Ljava/lang/String;Ljava/lang/String;)Lcom/behance/sdk/OAuth/TwitterClient;

    move-result-object v3

    invoke-virtual {v3}, Lcom/behance/sdk/OAuth/TwitterClient;->getOAuthProvider()Loauth/signpost/commonshttp/CommonsHttpOAuthProvider;

    move-result-object v3

    iput-object v3, p0, Lcom/behance/sdk/asynctasks/BehanceSDKRetrieveAccessTokenFromTwitterAsyncTask;->provider:Loauth/signpost/commonshttp/CommonsHttpOAuthProvider;

    .line 81
    iget-object v3, p0, Lcom/behance/sdk/asynctasks/BehanceSDKRetrieveAccessTokenFromTwitterAsyncTask;->consumerToken:Ljava/lang/String;

    iget-object v4, p0, Lcom/behance/sdk/asynctasks/BehanceSDKRetrieveAccessTokenFromTwitterAsyncTask;->consumerSecret:Ljava/lang/String;

    invoke-static {v3, v4}, Lcom/behance/sdk/OAuth/TwitterClient;->getInstance(Ljava/lang/String;Ljava/lang/String;)Lcom/behance/sdk/OAuth/TwitterClient;

    move-result-object v3

    invoke-virtual {v3}, Lcom/behance/sdk/OAuth/TwitterClient;->getOAuthConsumer()Loauth/signpost/OAuthConsumer;

    move-result-object v3

    iput-object v3, p0, Lcom/behance/sdk/asynctasks/BehanceSDKRetrieveAccessTokenFromTwitterAsyncTask;->consumer:Loauth/signpost/OAuthConsumer;

    .line 82
    iget-object v3, p0, Lcom/behance/sdk/asynctasks/BehanceSDKRetrieveAccessTokenFromTwitterAsyncTask;->consumerToken:Ljava/lang/String;

    iget-object v4, p0, Lcom/behance/sdk/asynctasks/BehanceSDKRetrieveAccessTokenFromTwitterAsyncTask;->consumerSecret:Ljava/lang/String;

    invoke-direct {p0, v1, v3, v4}, Lcom/behance/sdk/asynctasks/BehanceSDKRetrieveAccessTokenFromTwitterAsyncTask;->retrieveAccessTokenFromTwitter(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 83
    iget-object v3, p0, Lcom/behance/sdk/asynctasks/BehanceSDKRetrieveAccessTokenFromTwitterAsyncTask;->consumer:Loauth/signpost/OAuthConsumer;

    invoke-interface {v3}, Loauth/signpost/OAuthConsumer;->getToken()Ljava/lang/String;

    move-result-object v3

    if-eqz v3, :cond_65

    iget-object v3, p0, Lcom/behance/sdk/asynctasks/BehanceSDKRetrieveAccessTokenFromTwitterAsyncTask;->consumer:Loauth/signpost/OAuthConsumer;

    invoke-interface {v3}, Loauth/signpost/OAuthConsumer;->getToken()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/String;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_65

    iget-object v3, p0, Lcom/behance/sdk/asynctasks/BehanceSDKRetrieveAccessTokenFromTwitterAsyncTask;->consumer:Loauth/signpost/OAuthConsumer;

    invoke-interface {v3}, Loauth/signpost/OAuthConsumer;->getTokenSecret()Ljava/lang/String;

    move-result-object v3

    if-eqz v3, :cond_65

    iget-object v3, p0, Lcom/behance/sdk/asynctasks/BehanceSDKRetrieveAccessTokenFromTwitterAsyncTask;->consumer:Loauth/signpost/OAuthConsumer;

    invoke-interface {v3}, Loauth/signpost/OAuthConsumer;->getTokenSecret()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/String;->isEmpty()Z

    move-result v3

    if-eqz v3, :cond_7a

    .line 84
    :cond_65
    iget-object v3, p0, Lcom/behance/sdk/asynctasks/BehanceSDKRetrieveAccessTokenFromTwitterAsyncTask;->result:Lcom/behance/sdk/asynctasks/result/BehanceSDKRetrieveAccessTokenFromTwitterTaskResult;

    const/4 v4, 0x1

    invoke-virtual {v3, v4}, Lcom/behance/sdk/asynctasks/result/BehanceSDKRetrieveAccessTokenFromTwitterTaskResult;->setExceptionOccurred(Z)V

    .line 85
    iget-object v3, p0, Lcom/behance/sdk/asynctasks/BehanceSDKRetrieveAccessTokenFromTwitterAsyncTask;->result:Lcom/behance/sdk/asynctasks/result/BehanceSDKRetrieveAccessTokenFromTwitterTaskResult;

    new-instance v4, Ljava/lang/Exception;

    const-string v5, "Twitter Access token or access secret is empty"

    invoke-direct {v4, v5}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v4}, Lcom/behance/sdk/asynctasks/result/BehanceSDKRetrieveAccessTokenFromTwitterTaskResult;->setException(Ljava/lang/Exception;)V

    .line 86
    iget-object v3, p0, Lcom/behance/sdk/asynctasks/BehanceSDKRetrieveAccessTokenFromTwitterAsyncTask;->result:Lcom/behance/sdk/asynctasks/result/BehanceSDKRetrieveAccessTokenFromTwitterTaskResult;

    .line 96
    :goto_79
    return-object v3

    .line 88
    :cond_7a
    iget-object v3, p0, Lcom/behance/sdk/asynctasks/BehanceSDKRetrieveAccessTokenFromTwitterAsyncTask;->socialAccountDTO:Lcom/behance/sdk/dto/BehanceSDKSocialAccountDTO;

    if-eqz v3, :cond_a4

    .line 89
    iget-object v3, p0, Lcom/behance/sdk/asynctasks/BehanceSDKRetrieveAccessTokenFromTwitterAsyncTask;->socialAccountDTO:Lcom/behance/sdk/dto/BehanceSDKSocialAccountDTO;

    iget-object v4, p0, Lcom/behance/sdk/asynctasks/BehanceSDKRetrieveAccessTokenFromTwitterAsyncTask;->consumer:Loauth/signpost/OAuthConsumer;

    invoke-interface {v4}, Loauth/signpost/OAuthConsumer;->getToken()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Lcom/behance/sdk/dto/BehanceSDKSocialAccountDTO;->setUserAuthToken(Ljava/lang/String;)V

    .line 90
    iget-object v3, p0, Lcom/behance/sdk/asynctasks/BehanceSDKRetrieveAccessTokenFromTwitterAsyncTask;->socialAccountDTO:Lcom/behance/sdk/dto/BehanceSDKSocialAccountDTO;

    iget-object v4, p0, Lcom/behance/sdk/asynctasks/BehanceSDKRetrieveAccessTokenFromTwitterAsyncTask;->consumer:Loauth/signpost/OAuthConsumer;

    invoke-interface {v4}, Loauth/signpost/OAuthConsumer;->getTokenSecret()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Lcom/behance/sdk/dto/BehanceSDKSocialAccountDTO;->setAdditionalData(Ljava/lang/String;)V

    .line 91
    invoke-direct {p0}, Lcom/behance/sdk/asynctasks/BehanceSDKRetrieveAccessTokenFromTwitterAsyncTask;->retrieveUserNameFromTwitter()Ljava/lang/String;

    move-result-object v2

    .line 92
    .local v2, "userName":Ljava/lang/String;
    iget-object v3, p0, Lcom/behance/sdk/asynctasks/BehanceSDKRetrieveAccessTokenFromTwitterAsyncTask;->socialAccountDTO:Lcom/behance/sdk/dto/BehanceSDKSocialAccountDTO;

    invoke-virtual {v3, v2}, Lcom/behance/sdk/dto/BehanceSDKSocialAccountDTO;->setUserId(Ljava/lang/String;)V

    .line 93
    iget-object v3, p0, Lcom/behance/sdk/asynctasks/BehanceSDKRetrieveAccessTokenFromTwitterAsyncTask;->socialAccountManager:Lcom/behance/sdk/BehanceSDKSocialAccountManager;

    iget-object v4, p0, Lcom/behance/sdk/asynctasks/BehanceSDKRetrieveAccessTokenFromTwitterAsyncTask;->socialAccountDTO:Lcom/behance/sdk/dto/BehanceSDKSocialAccountDTO;

    invoke-virtual {v3, v4}, Lcom/behance/sdk/BehanceSDKSocialAccountManager;->updateAccount(Lcom/behance/sdk/dto/BehanceSDKSocialAccountDTO;)Z

    .line 96
    .end local v2    # "userName":Ljava/lang/String;
    :cond_a4
    iget-object v3, p0, Lcom/behance/sdk/asynctasks/BehanceSDKRetrieveAccessTokenFromTwitterAsyncTask;->result:Lcom/behance/sdk/asynctasks/result/BehanceSDKRetrieveAccessTokenFromTwitterTaskResult;

    goto :goto_79
.end method

.method protected bridge synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .registers 3

    .prologue
    .line 50
    check-cast p1, [Lcom/behance/sdk/asynctask/params/BehanceSDKRetrieveAccessTokenFromTwitterAsyncTaskParams;

    invoke-virtual {p0, p1}, Lcom/behance/sdk/asynctasks/BehanceSDKRetrieveAccessTokenFromTwitterAsyncTask;->doInBackground([Lcom/behance/sdk/asynctask/params/BehanceSDKRetrieveAccessTokenFromTwitterAsyncTaskParams;)Lcom/behance/sdk/asynctasks/result/BehanceSDKRetrieveAccessTokenFromTwitterTaskResult;

    move-result-object v0

    return-object v0
.end method

.method protected onPostExecute(Lcom/behance/sdk/asynctasks/result/BehanceSDKRetrieveAccessTokenFromTwitterTaskResult;)V
    .registers 3
    .param p1, "result"    # Lcom/behance/sdk/asynctasks/result/BehanceSDKRetrieveAccessTokenFromTwitterTaskResult;

    .prologue
    .line 155
    invoke-virtual {p1}, Lcom/behance/sdk/asynctasks/result/BehanceSDKRetrieveAccessTokenFromTwitterTaskResult;->isExceptionOccurred()Z

    move-result v0

    if-eqz v0, :cond_c

    .line 156
    iget-object v0, p0, Lcom/behance/sdk/asynctasks/BehanceSDKRetrieveAccessTokenFromTwitterAsyncTask;->listener:Lcom/behance/sdk/asynctask/listeners/IBehanceSDKRetrieveAccessTokenFromTwitterTaskListener;

    invoke-interface {v0, p1}, Lcom/behance/sdk/asynctask/listeners/IBehanceSDKRetrieveAccessTokenFromTwitterTaskListener;->onRetrieveAccessTokenFromTwitterFailure(Lcom/behance/sdk/asynctasks/result/BehanceSDKRetrieveAccessTokenFromTwitterTaskResult;)V

    .line 161
    :goto_b
    return-void

    .line 158
    :cond_c
    iget-object v0, p0, Lcom/behance/sdk/asynctasks/BehanceSDKRetrieveAccessTokenFromTwitterAsyncTask;->listener:Lcom/behance/sdk/asynctask/listeners/IBehanceSDKRetrieveAccessTokenFromTwitterTaskListener;

    invoke-interface {v0, p1}, Lcom/behance/sdk/asynctask/listeners/IBehanceSDKRetrieveAccessTokenFromTwitterTaskListener;->onRetrieveAccessTokenFromTwitterSuccess(Lcom/behance/sdk/asynctasks/result/BehanceSDKRetrieveAccessTokenFromTwitterTaskResult;)V

    goto :goto_b
.end method

.method protected bridge synthetic onPostExecute(Ljava/lang/Object;)V
    .registers 2

    .prologue
    .line 50
    check-cast p1, Lcom/behance/sdk/asynctasks/result/BehanceSDKRetrieveAccessTokenFromTwitterTaskResult;

    invoke-virtual {p0, p1}, Lcom/behance/sdk/asynctasks/BehanceSDKRetrieveAccessTokenFromTwitterAsyncTask;->onPostExecute(Lcom/behance/sdk/asynctasks/result/BehanceSDKRetrieveAccessTokenFromTwitterTaskResult;)V

    return-void
.end method
