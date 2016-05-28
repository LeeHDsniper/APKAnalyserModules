.class Lcom/facebook/AuthorizationClient$5;
.super Ljava/lang/Object;
.source "AuthorizationClient.java"

# interfaces
.implements Lcom/facebook/RequestBatch$Callback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/facebook/AuthorizationClient;->createReauthValidationBatch(Lcom/facebook/AuthorizationClient$Result;)Lcom/facebook/RequestBatch;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/facebook/AuthorizationClient;

.field private final synthetic val$declinedPermissions:Ljava/util/ArrayList;

.field private final synthetic val$fbids:Ljava/util/ArrayList;

.field private final synthetic val$grantedPermissions:Ljava/util/ArrayList;

.field private final synthetic val$pendingResult:Lcom/facebook/AuthorizationClient$Result;


# direct methods
.method constructor <init>(Lcom/facebook/AuthorizationClient;Ljava/util/ArrayList;Lcom/facebook/AuthorizationClient$Result;Ljava/util/ArrayList;Ljava/util/ArrayList;)V
    .registers 6

    .prologue
    .line 1
    iput-object p1, p0, Lcom/facebook/AuthorizationClient$5;->this$0:Lcom/facebook/AuthorizationClient;

    iput-object p2, p0, Lcom/facebook/AuthorizationClient$5;->val$fbids:Ljava/util/ArrayList;

    iput-object p3, p0, Lcom/facebook/AuthorizationClient$5;->val$pendingResult:Lcom/facebook/AuthorizationClient$Result;

    iput-object p4, p0, Lcom/facebook/AuthorizationClient$5;->val$grantedPermissions:Ljava/util/ArrayList;

    iput-object p5, p0, Lcom/facebook/AuthorizationClient$5;->val$declinedPermissions:Ljava/util/ArrayList;

    .line 407
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onBatchCompleted(Lcom/facebook/RequestBatch;)V
    .registers 9
    .param p1, "batch"    # Lcom/facebook/RequestBatch;

    .prologue
    .line 411
    const/4 v1, 0x0

    .line 412
    .local v1, "result":Lcom/facebook/AuthorizationClient$Result;
    :try_start_1
    iget-object v3, p0, Lcom/facebook/AuthorizationClient$5;->val$fbids:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v3

    const/4 v4, 0x2

    if-ne v3, v4, :cond_51

    iget-object v3, p0, Lcom/facebook/AuthorizationClient$5;->val$fbids:Ljava/util/ArrayList;

    const/4 v4, 0x0

    invoke-virtual {v3, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    if-eqz v3, :cond_51

    iget-object v3, p0, Lcom/facebook/AuthorizationClient$5;->val$fbids:Ljava/util/ArrayList;

    const/4 v4, 0x1

    invoke-virtual {v3, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    if-eqz v3, :cond_51

    .line 413
    iget-object v3, p0, Lcom/facebook/AuthorizationClient$5;->val$fbids:Ljava/util/ArrayList;

    const/4 v4, 0x0

    invoke-virtual {v3, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    iget-object v4, p0, Lcom/facebook/AuthorizationClient$5;->val$fbids:Ljava/util/ArrayList;

    const/4 v5, 0x1

    invoke-virtual {v4, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_51

    .line 416
    iget-object v3, p0, Lcom/facebook/AuthorizationClient$5;->val$pendingResult:Lcom/facebook/AuthorizationClient$Result;

    iget-object v3, v3, Lcom/facebook/AuthorizationClient$Result;->token:Lcom/facebook/AccessToken;

    .line 417
    iget-object v4, p0, Lcom/facebook/AuthorizationClient$5;->val$grantedPermissions:Ljava/util/ArrayList;

    iget-object v5, p0, Lcom/facebook/AuthorizationClient$5;->val$declinedPermissions:Ljava/util/ArrayList;

    .line 416
    invoke-static {v3, v4, v5}, Lcom/facebook/AccessToken;->createFromTokenWithRefreshedPermissions(Lcom/facebook/AccessToken;Ljava/util/List;Ljava/util/List;)Lcom/facebook/AccessToken;

    move-result-object v2

    .line 418
    .local v2, "tokenWithPermissions":Lcom/facebook/AccessToken;
    iget-object v3, p0, Lcom/facebook/AuthorizationClient$5;->this$0:Lcom/facebook/AuthorizationClient;

    iget-object v3, v3, Lcom/facebook/AuthorizationClient;->pendingRequest:Lcom/facebook/AuthorizationClient$AuthorizationRequest;

    invoke-static {v3, v2}, Lcom/facebook/AuthorizationClient$Result;->createTokenResult(Lcom/facebook/AuthorizationClient$AuthorizationRequest;Lcom/facebook/AccessToken;)Lcom/facebook/AuthorizationClient$Result;

    move-result-object v1

    .line 423
    .end local v2    # "tokenWithPermissions":Lcom/facebook/AccessToken;
    :goto_46
    iget-object v3, p0, Lcom/facebook/AuthorizationClient$5;->this$0:Lcom/facebook/AuthorizationClient;

    invoke-virtual {v3, v1}, Lcom/facebook/AuthorizationClient;->complete(Lcom/facebook/AuthorizationClient$Result;)V
    :try_end_4b
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_4b} :catch_5d
    .catchall {:try_start_1 .. :try_end_4b} :catchall_77

    .line 427
    iget-object v3, p0, Lcom/facebook/AuthorizationClient$5;->this$0:Lcom/facebook/AuthorizationClient;

    # invokes: Lcom/facebook/AuthorizationClient;->notifyBackgroundProcessingStop()V
    invoke-static {v3}, Lcom/facebook/AuthorizationClient;->access$3(Lcom/facebook/AuthorizationClient;)V

    .line 429
    :goto_50
    return-void

    .line 421
    :cond_51
    :try_start_51
    iget-object v3, p0, Lcom/facebook/AuthorizationClient$5;->this$0:Lcom/facebook/AuthorizationClient;

    iget-object v3, v3, Lcom/facebook/AuthorizationClient;->pendingRequest:Lcom/facebook/AuthorizationClient$AuthorizationRequest;

    const-string v4, "User logged in as different Facebook user."

    const/4 v5, 0x0

    invoke-static {v3, v4, v5}, Lcom/facebook/AuthorizationClient$Result;->createErrorResult(Lcom/facebook/AuthorizationClient$AuthorizationRequest;Ljava/lang/String;Ljava/lang/String;)Lcom/facebook/AuthorizationClient$Result;
    :try_end_5b
    .catch Ljava/lang/Exception; {:try_start_51 .. :try_end_5b} :catch_5d
    .catchall {:try_start_51 .. :try_end_5b} :catchall_77

    move-result-object v1

    .line 420
    goto :goto_46

    .line 424
    :catch_5d
    move-exception v0

    .line 425
    .local v0, "ex":Ljava/lang/Exception;
    :try_start_5e
    iget-object v3, p0, Lcom/facebook/AuthorizationClient$5;->this$0:Lcom/facebook/AuthorizationClient;

    iget-object v4, p0, Lcom/facebook/AuthorizationClient$5;->this$0:Lcom/facebook/AuthorizationClient;

    iget-object v4, v4, Lcom/facebook/AuthorizationClient;->pendingRequest:Lcom/facebook/AuthorizationClient$AuthorizationRequest;

    const-string v5, "Caught exception"

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v6

    invoke-static {v4, v5, v6}, Lcom/facebook/AuthorizationClient$Result;->createErrorResult(Lcom/facebook/AuthorizationClient$AuthorizationRequest;Ljava/lang/String;Ljava/lang/String;)Lcom/facebook/AuthorizationClient$Result;

    move-result-object v4

    invoke-virtual {v3, v4}, Lcom/facebook/AuthorizationClient;->complete(Lcom/facebook/AuthorizationClient$Result;)V
    :try_end_71
    .catchall {:try_start_5e .. :try_end_71} :catchall_77

    .line 427
    iget-object v3, p0, Lcom/facebook/AuthorizationClient$5;->this$0:Lcom/facebook/AuthorizationClient;

    # invokes: Lcom/facebook/AuthorizationClient;->notifyBackgroundProcessingStop()V
    invoke-static {v3}, Lcom/facebook/AuthorizationClient;->access$3(Lcom/facebook/AuthorizationClient;)V

    goto :goto_50

    .line 426
    .end local v0    # "ex":Ljava/lang/Exception;
    :catchall_77
    move-exception v3

    .line 427
    iget-object v4, p0, Lcom/facebook/AuthorizationClient$5;->this$0:Lcom/facebook/AuthorizationClient;

    # invokes: Lcom/facebook/AuthorizationClient;->notifyBackgroundProcessingStop()V
    invoke-static {v4}, Lcom/facebook/AuthorizationClient;->access$3(Lcom/facebook/AuthorizationClient;)V

    .line 428
    throw v3
.end method
