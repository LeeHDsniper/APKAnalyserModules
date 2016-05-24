.class Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageAsyncResponseHandler$1;
.super Ljava/lang/Object;
.source "AdobeStorageAsyncResponseHandler.java"

# interfaces
.implements Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession$IStorageResponseCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageAsyncResponseHandler;->poll(Ljava/lang/String;JLandroid/os/Handler;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageAsyncResponseHandler;

.field final synthetic val$callbackRequiredForHandler:Landroid/os/Handler;

.field final synthetic val$frequency:J

.field final synthetic val$href:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageAsyncResponseHandler;JLjava/lang/String;Landroid/os/Handler;)V
    .registers 6
    .param p1, "this$0"    # Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageAsyncResponseHandler;

    .prologue
    .line 71
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageAsyncResponseHandler$1;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageAsyncResponseHandler;

    iput-wide p2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageAsyncResponseHandler$1;->val$frequency:J

    iput-object p4, p0, Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageAsyncResponseHandler$1;->val$href:Ljava/lang/String;

    iput-object p5, p0, Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageAsyncResponseHandler$1;->val$callbackRequiredForHandler:Landroid/os/Handler;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onComplete(Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;)V
    .registers 15
    .param p1, "httpResponse"    # Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;

    .prologue
    .line 74
    invoke-virtual {p1}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;->getStatusCode()I

    move-result v8

    packed-switch v8, :pswitch_data_6e

    .line 115
    :goto_7
    :pswitch_7
    return-void

    .line 76
    :pswitch_8
    invoke-virtual {p1}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;->getDataString()Ljava/lang/String;

    move-result-object v5

    .line 77
    .local v5, "response":Ljava/lang/String;
    const-string v8, " "

    invoke-virtual {v5, v8}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v2

    .line 78
    .local v2, "index":I
    add-int/lit8 v8, v2, 0x1

    invoke-virtual {v5, v8}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v5

    .line 79
    const-string v8, "^([0-9]+)"

    invoke-static {v8}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v4

    .line 80
    .local v4, "p":Ljava/util/regex/Pattern;
    invoke-virtual {v4, v5}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v3

    .line 81
    .local v3, "m":Ljava/util/regex/Matcher;
    const/4 v7, 0x0

    .line 82
    .local v7, "statusCode":I
    invoke-virtual {v3}, Ljava/util/regex/Matcher;->find()Z

    move-result v8

    if-eqz v8, :cond_4f

    .line 84
    const/4 v8, 0x0

    :try_start_2a
    invoke-virtual {v3, v8}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v6

    .line 85
    .local v6, "status":Ljava/lang/String;
    invoke-static {v6}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I
    :try_end_31
    .catch Ljava/lang/Exception; {:try_start_2a .. :try_end_31} :catch_42

    move-result v7

    .line 92
    .end local v6    # "status":Ljava/lang/String;
    :goto_32
    const/16 v8, 0xc8

    if-eq v7, v8, :cond_3a

    const/16 v8, 0xc9

    if-ne v7, v8, :cond_47

    .line 93
    :cond_3a
    iget-object v8, p0, Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageAsyncResponseHandler$1;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageAsyncResponseHandler;

    iget-object v8, v8, Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageAsyncResponseHandler;->callback:Lcom/adobe/creativesdk/foundation/internal/storage/model/services/IAdobeStorageAsyncResponseHandlerCallback;

    invoke-interface {v8, p1}, Lcom/adobe/creativesdk/foundation/internal/storage/model/services/IAdobeStorageAsyncResponseHandlerCallback;->onComplete(Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;)V

    goto :goto_7

    .line 87
    :catch_42
    move-exception v1

    .line 89
    .local v1, "exp":Ljava/lang/Exception;
    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_32

    .line 95
    .end local v1    # "exp":Ljava/lang/Exception;
    :cond_47
    iget-object v8, p0, Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageAsyncResponseHandler$1;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageAsyncResponseHandler;

    iget-object v8, v8, Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageAsyncResponseHandler;->callback:Lcom/adobe/creativesdk/foundation/internal/storage/model/services/IAdobeStorageAsyncResponseHandlerCallback;

    invoke-interface {v8, p1}, Lcom/adobe/creativesdk/foundation/internal/storage/model/services/IAdobeStorageAsyncResponseHandlerCallback;->onError(Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;)V

    goto :goto_7

    .line 99
    :cond_4f
    iget-object v8, p0, Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageAsyncResponseHandler$1;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageAsyncResponseHandler;

    iget-object v8, v8, Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageAsyncResponseHandler;->callback:Lcom/adobe/creativesdk/foundation/internal/storage/model/services/IAdobeStorageAsyncResponseHandlerCallback;

    invoke-interface {v8, p1}, Lcom/adobe/creativesdk/foundation/internal/storage/model/services/IAdobeStorageAsyncResponseHandlerCallback;->onError(Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;)V

    goto :goto_7

    .line 105
    .end local v2    # "index":I
    .end local v3    # "m":Ljava/util/regex/Matcher;
    .end local v4    # "p":Ljava/util/regex/Pattern;
    .end local v5    # "response":Ljava/lang/String;
    .end local v7    # "statusCode":I
    :pswitch_57
    :try_start_57
    iget-wide v8, p0, Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageAsyncResponseHandler$1;->val$frequency:J

    invoke-static {v8, v9}, Ljava/lang/Thread;->sleep(J)V
    :try_end_5c
    .catch Ljava/lang/InterruptedException; {:try_start_57 .. :try_end_5c} :catch_68

    .line 109
    :goto_5c
    iget-object v8, p0, Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageAsyncResponseHandler$1;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageAsyncResponseHandler;

    iget-object v9, p0, Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageAsyncResponseHandler$1;->val$href:Ljava/lang/String;

    iget-wide v10, p0, Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageAsyncResponseHandler$1;->val$frequency:J

    iget-object v12, p0, Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageAsyncResponseHandler$1;->val$callbackRequiredForHandler:Landroid/os/Handler;

    # invokes: Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageAsyncResponseHandler;->poll(Ljava/lang/String;JLandroid/os/Handler;)V
    invoke-static {v8, v9, v10, v11, v12}, Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageAsyncResponseHandler;->access$000(Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageAsyncResponseHandler;Ljava/lang/String;JLandroid/os/Handler;)V

    goto :goto_7

    .line 106
    :catch_68
    move-exception v0

    .line 107
    .local v0, "e":Ljava/lang/InterruptedException;
    invoke-virtual {v0}, Ljava/lang/InterruptedException;->printStackTrace()V

    goto :goto_5c

    .line 74
    nop

    :pswitch_data_6e
    .packed-switch 0xc8
        :pswitch_8
        :pswitch_7
        :pswitch_57
    .end packed-switch
.end method

.method public onError(Lcom/adobe/creativesdk/foundation/network/AdobeNetworkException;)V
    .registers 3
    .param p1, "error"    # Lcom/adobe/creativesdk/foundation/network/AdobeNetworkException;

    .prologue
    .line 119
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageAsyncResponseHandler$1;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageAsyncResponseHandler;

    iget-object v0, v0, Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageAsyncResponseHandler;->callback:Lcom/adobe/creativesdk/foundation/internal/storage/model/services/IAdobeStorageAsyncResponseHandlerCallback;

    invoke-interface {v0, p1}, Lcom/adobe/creativesdk/foundation/internal/storage/model/services/IAdobeStorageAsyncResponseHandlerCallback;->onError(Lcom/adobe/creativesdk/foundation/network/AdobeNetworkException;)V

    .line 120
    return-void
.end method

.method public onProgress(D)V
    .registers 3
    .param p1, "progress"    # D

    .prologue
    .line 125
    return-void
.end method
