.class public Lcom/behance/sdk/asynctasks/BehanceSDKGetAuthURLFromTwitterAsyncTask;
.super Landroid/os/AsyncTask;
.source "BehanceSDKGetAuthURLFromTwitterAsyncTask.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/os/AsyncTask",
        "<",
        "Lcom/behance/sdk/asynctask/params/BehanceSDKGetAuthURLFromTwitterAsyncTaskParams;",
        "Ljava/lang/Void;",
        "Lcom/behance/sdk/asynctasks/result/BehanceSDKGetAuthUrlFromTwitterTaskResult;",
        ">;"
    }
.end annotation


# static fields
.field private static final logger:Lcom/behance/sdk/logger/ILogger;


# instance fields
.field private listener:Lcom/behance/sdk/asynctask/listeners/IBehanceSDKGetAuthURLFromTwitterTaskListener;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 35
    const-class v0, Lcom/behance/sdk/asynctasks/BehanceSDKGetAuthURLFromTwitterAsyncTask;

    invoke-static {v0}, Lcom/behance/sdk/logger/LoggerFactory;->getLogger(Ljava/lang/Class;)Lcom/behance/sdk/logger/ILogger;

    move-result-object v0

    sput-object v0, Lcom/behance/sdk/asynctasks/BehanceSDKGetAuthURLFromTwitterAsyncTask;->logger:Lcom/behance/sdk/logger/ILogger;

    return-void
.end method

.method public constructor <init>(Lcom/behance/sdk/asynctask/listeners/IBehanceSDKGetAuthURLFromTwitterTaskListener;)V
    .registers 2
    .param p1, "listener"    # Lcom/behance/sdk/asynctask/listeners/IBehanceSDKGetAuthURLFromTwitterTaskListener;

    .prologue
    .line 39
    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    .line 40
    iput-object p1, p0, Lcom/behance/sdk/asynctasks/BehanceSDKGetAuthURLFromTwitterAsyncTask;->listener:Lcom/behance/sdk/asynctask/listeners/IBehanceSDKGetAuthURLFromTwitterTaskListener;

    .line 41
    return-void
.end method


# virtual methods
.method protected varargs doInBackground([Lcom/behance/sdk/asynctask/params/BehanceSDKGetAuthURLFromTwitterAsyncTaskParams;)Lcom/behance/sdk/asynctasks/result/BehanceSDKGetAuthUrlFromTwitterTaskResult;
    .registers 14
    .param p1, "params"    # [Lcom/behance/sdk/asynctask/params/BehanceSDKGetAuthURLFromTwitterAsyncTaskParams;

    .prologue
    const/4 v11, 0x0

    const/4 v10, 0x1

    .line 45
    new-instance v6, Lcom/behance/sdk/asynctasks/result/BehanceSDKGetAuthUrlFromTwitterTaskResult;

    invoke-direct {v6}, Lcom/behance/sdk/asynctasks/result/BehanceSDKGetAuthUrlFromTwitterTaskResult;-><init>()V

    .line 46
    .local v6, "result":Lcom/behance/sdk/asynctasks/result/BehanceSDKGetAuthUrlFromTwitterTaskResult;
    const/4 v0, 0x0

    .line 47
    .local v0, "authUrl":Ljava/lang/String;
    aget-object v7, p1, v11

    .line 48
    .local v7, "taskParams":Lcom/behance/sdk/asynctask/params/BehanceSDKGetAuthURLFromTwitterAsyncTaskParams;
    invoke-virtual {v7}, Lcom/behance/sdk/asynctask/params/BehanceSDKGetAuthURLFromTwitterAsyncTaskParams;->getConsumerKey()Ljava/lang/String;

    move-result-object v3

    .line 49
    .local v3, "consumerToken":Ljava/lang/String;
    invoke-virtual {v7}, Lcom/behance/sdk/asynctask/params/BehanceSDKGetAuthURLFromTwitterAsyncTaskParams;->getConsumerSecret()Ljava/lang/String;

    move-result-object v2

    .line 51
    .local v2, "consumerSecret":Ljava/lang/String;
    invoke-static {v3, v2}, Lcom/behance/sdk/OAuth/TwitterClient;->getInstance(Ljava/lang/String;Ljava/lang/String;)Lcom/behance/sdk/OAuth/TwitterClient;

    move-result-object v8

    invoke-virtual {v8}, Lcom/behance/sdk/OAuth/TwitterClient;->getOAuthProvider()Loauth/signpost/commonshttp/CommonsHttpOAuthProvider;

    move-result-object v5

    .line 52
    .local v5, "provider":Loauth/signpost/commonshttp/CommonsHttpOAuthProvider;
    invoke-static {v3, v2}, Lcom/behance/sdk/OAuth/TwitterClient;->getInstance(Ljava/lang/String;Ljava/lang/String;)Lcom/behance/sdk/OAuth/TwitterClient;

    move-result-object v8

    invoke-virtual {v8}, Lcom/behance/sdk/OAuth/TwitterClient;->getOAuthConsumer()Loauth/signpost/OAuthConsumer;

    move-result-object v1

    .line 54
    .local v1, "consumer":Loauth/signpost/OAuthConsumer;
    :try_start_22
    const-string v8, "com.behance.behance://oauth.callback"

    const/4 v9, 0x0

    new-array v9, v9, [Ljava/lang/String;

    invoke-virtual {v5, v1, v8, v9}, Loauth/signpost/commonshttp/CommonsHttpOAuthProvider;->retrieveRequestToken(Loauth/signpost/OAuthConsumer;Ljava/lang/String;[Ljava/lang/String;)Ljava/lang/String;
    :try_end_2a
    .catch Loauth/signpost/exception/OAuthMessageSignerException; {:try_start_22 .. :try_end_2a} :catch_3a
    .catch Loauth/signpost/exception/OAuthNotAuthorizedException; {:try_start_22 .. :try_end_2a} :catch_42
    .catch Loauth/signpost/exception/OAuthExpectationFailedException; {:try_start_22 .. :try_end_2a} :catch_4a
    .catch Loauth/signpost/exception/OAuthCommunicationException; {:try_start_22 .. :try_end_2a} :catch_52
    .catch Ljava/lang/Exception; {:try_start_22 .. :try_end_2a} :catch_5a

    move-result-object v0

    .line 71
    :goto_2b
    sget-object v8, Lcom/behance/sdk/asynctasks/BehanceSDKGetAuthURLFromTwitterAsyncTask;->logger:Lcom/behance/sdk/logger/ILogger;

    const-string v9, "Auth URL returned from twitter is %s"

    new-array v10, v10, [Ljava/lang/Object;

    aput-object v0, v10, v11

    invoke-interface {v8, v9, v10}, Lcom/behance/sdk/logger/ILogger;->debug(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 72
    invoke-virtual {v6, v0}, Lcom/behance/sdk/asynctasks/result/BehanceSDKGetAuthUrlFromTwitterTaskResult;->setAuthURL(Ljava/lang/String;)V

    .line 73
    return-object v6

    .line 55
    :catch_3a
    move-exception v4

    .line 56
    .local v4, "e":Loauth/signpost/exception/OAuthMessageSignerException;
    invoke-virtual {v6, v10}, Lcom/behance/sdk/asynctasks/result/BehanceSDKGetAuthUrlFromTwitterTaskResult;->setExceptionOccurred(Z)V

    .line 57
    invoke-virtual {v6, v4}, Lcom/behance/sdk/asynctasks/result/BehanceSDKGetAuthUrlFromTwitterTaskResult;->setException(Ljava/lang/Exception;)V

    goto :goto_2b

    .line 58
    .end local v4    # "e":Loauth/signpost/exception/OAuthMessageSignerException;
    :catch_42
    move-exception v4

    .line 59
    .local v4, "e":Loauth/signpost/exception/OAuthNotAuthorizedException;
    invoke-virtual {v6, v10}, Lcom/behance/sdk/asynctasks/result/BehanceSDKGetAuthUrlFromTwitterTaskResult;->setExceptionOccurred(Z)V

    .line 60
    invoke-virtual {v6, v4}, Lcom/behance/sdk/asynctasks/result/BehanceSDKGetAuthUrlFromTwitterTaskResult;->setException(Ljava/lang/Exception;)V

    goto :goto_2b

    .line 61
    .end local v4    # "e":Loauth/signpost/exception/OAuthNotAuthorizedException;
    :catch_4a
    move-exception v4

    .line 62
    .local v4, "e":Loauth/signpost/exception/OAuthExpectationFailedException;
    invoke-virtual {v6, v10}, Lcom/behance/sdk/asynctasks/result/BehanceSDKGetAuthUrlFromTwitterTaskResult;->setExceptionOccurred(Z)V

    .line 63
    invoke-virtual {v6, v4}, Lcom/behance/sdk/asynctasks/result/BehanceSDKGetAuthUrlFromTwitterTaskResult;->setException(Ljava/lang/Exception;)V

    goto :goto_2b

    .line 64
    .end local v4    # "e":Loauth/signpost/exception/OAuthExpectationFailedException;
    :catch_52
    move-exception v4

    .line 65
    .local v4, "e":Loauth/signpost/exception/OAuthCommunicationException;
    invoke-virtual {v6, v10}, Lcom/behance/sdk/asynctasks/result/BehanceSDKGetAuthUrlFromTwitterTaskResult;->setExceptionOccurred(Z)V

    .line 66
    invoke-virtual {v6, v4}, Lcom/behance/sdk/asynctasks/result/BehanceSDKGetAuthUrlFromTwitterTaskResult;->setException(Ljava/lang/Exception;)V

    goto :goto_2b

    .line 67
    .end local v4    # "e":Loauth/signpost/exception/OAuthCommunicationException;
    :catch_5a
    move-exception v4

    .line 68
    .local v4, "e":Ljava/lang/Exception;
    invoke-virtual {v6, v10}, Lcom/behance/sdk/asynctasks/result/BehanceSDKGetAuthUrlFromTwitterTaskResult;->setExceptionOccurred(Z)V

    .line 69
    invoke-virtual {v6, v4}, Lcom/behance/sdk/asynctasks/result/BehanceSDKGetAuthUrlFromTwitterTaskResult;->setException(Ljava/lang/Exception;)V

    goto :goto_2b
.end method

.method protected bridge synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .registers 3

    .prologue
    .line 33
    check-cast p1, [Lcom/behance/sdk/asynctask/params/BehanceSDKGetAuthURLFromTwitterAsyncTaskParams;

    invoke-virtual {p0, p1}, Lcom/behance/sdk/asynctasks/BehanceSDKGetAuthURLFromTwitterAsyncTask;->doInBackground([Lcom/behance/sdk/asynctask/params/BehanceSDKGetAuthURLFromTwitterAsyncTaskParams;)Lcom/behance/sdk/asynctasks/result/BehanceSDKGetAuthUrlFromTwitterTaskResult;

    move-result-object v0

    return-object v0
.end method

.method protected onPostExecute(Lcom/behance/sdk/asynctasks/result/BehanceSDKGetAuthUrlFromTwitterTaskResult;)V
    .registers 3
    .param p1, "result"    # Lcom/behance/sdk/asynctasks/result/BehanceSDKGetAuthUrlFromTwitterTaskResult;

    .prologue
    .line 78
    invoke-virtual {p1}, Lcom/behance/sdk/asynctasks/result/BehanceSDKGetAuthUrlFromTwitterTaskResult;->isExceptionOccurred()Z

    move-result v0

    if-eqz v0, :cond_c

    .line 79
    iget-object v0, p0, Lcom/behance/sdk/asynctasks/BehanceSDKGetAuthURLFromTwitterAsyncTask;->listener:Lcom/behance/sdk/asynctask/listeners/IBehanceSDKGetAuthURLFromTwitterTaskListener;

    invoke-interface {v0, p1}, Lcom/behance/sdk/asynctask/listeners/IBehanceSDKGetAuthURLFromTwitterTaskListener;->onGetAuthURLFromTwitterFailure(Lcom/behance/sdk/asynctasks/result/BehanceSDKGetAuthUrlFromTwitterTaskResult;)V

    .line 84
    :goto_b
    return-void

    .line 81
    :cond_c
    iget-object v0, p0, Lcom/behance/sdk/asynctasks/BehanceSDKGetAuthURLFromTwitterAsyncTask;->listener:Lcom/behance/sdk/asynctask/listeners/IBehanceSDKGetAuthURLFromTwitterTaskListener;

    invoke-interface {v0, p1}, Lcom/behance/sdk/asynctask/listeners/IBehanceSDKGetAuthURLFromTwitterTaskListener;->onGetAuthURLFromTwitterSuccess(Lcom/behance/sdk/asynctasks/result/BehanceSDKGetAuthUrlFromTwitterTaskResult;)V

    goto :goto_b
.end method

.method protected bridge synthetic onPostExecute(Ljava/lang/Object;)V
    .registers 2

    .prologue
    .line 33
    check-cast p1, Lcom/behance/sdk/asynctasks/result/BehanceSDKGetAuthUrlFromTwitterTaskResult;

    invoke-virtual {p0, p1}, Lcom/behance/sdk/asynctasks/BehanceSDKGetAuthURLFromTwitterAsyncTask;->onPostExecute(Lcom/behance/sdk/asynctasks/result/BehanceSDKGetAuthUrlFromTwitterTaskResult;)V

    return-void
.end method
