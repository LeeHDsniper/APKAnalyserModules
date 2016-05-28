.class Lcom/facebook/AuthorizationClient$GetTokenAuthHandler;
.super Lcom/facebook/AuthorizationClient$AuthHandler;
.source "AuthorizationClient.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/facebook/AuthorizationClient;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "GetTokenAuthHandler"
.end annotation


# static fields
.field private static final serialVersionUID:J = 0x1L


# instance fields
.field private transient getTokenClient:Lcom/facebook/GetTokenClient;

.field final synthetic this$0:Lcom/facebook/AuthorizationClient;


# direct methods
.method constructor <init>(Lcom/facebook/AuthorizationClient;)V
    .registers 2

    .prologue
    .line 702
    iput-object p1, p0, Lcom/facebook/AuthorizationClient$GetTokenAuthHandler;->this$0:Lcom/facebook/AuthorizationClient;

    invoke-direct {p0, p1}, Lcom/facebook/AuthorizationClient$AuthHandler;-><init>(Lcom/facebook/AuthorizationClient;)V

    return-void
.end method


# virtual methods
.method cancel()V
    .registers 2

    .prologue
    .line 713
    iget-object v0, p0, Lcom/facebook/AuthorizationClient$GetTokenAuthHandler;->getTokenClient:Lcom/facebook/GetTokenClient;

    if-eqz v0, :cond_c

    .line 714
    iget-object v0, p0, Lcom/facebook/AuthorizationClient$GetTokenAuthHandler;->getTokenClient:Lcom/facebook/GetTokenClient;

    invoke-virtual {v0}, Lcom/facebook/GetTokenClient;->cancel()V

    .line 715
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/facebook/AuthorizationClient$GetTokenAuthHandler;->getTokenClient:Lcom/facebook/GetTokenClient;

    .line 717
    :cond_c
    return-void
.end method

.method getNameForLogging()Ljava/lang/String;
    .registers 2

    .prologue
    .line 708
    const-string v0, "get_token"

    return-object v0
.end method

.method getTokenCompleted(Lcom/facebook/AuthorizationClient$AuthorizationRequest;Landroid/os/Bundle;)V
    .registers 11
    .param p1, "request"    # Lcom/facebook/AuthorizationClient$AuthorizationRequest;
    .param p2, "result"    # Landroid/os/Bundle;

    .prologue
    .line 746
    const/4 v6, 0x0

    iput-object v6, p0, Lcom/facebook/AuthorizationClient$GetTokenAuthHandler;->getTokenClient:Lcom/facebook/GetTokenClient;

    .line 748
    iget-object v6, p0, Lcom/facebook/AuthorizationClient$GetTokenAuthHandler;->this$0:Lcom/facebook/AuthorizationClient;

    # invokes: Lcom/facebook/AuthorizationClient;->notifyBackgroundProcessingStop()V
    invoke-static {v6}, Lcom/facebook/AuthorizationClient;->access$3(Lcom/facebook/AuthorizationClient;)V

    .line 750
    if-eqz p2, :cond_55

    .line 751
    const-string v6, "com.facebook.platform.extra.PERMISSIONS"

    invoke-virtual {p2, v6}, Landroid/os/Bundle;->getStringArrayList(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v0

    .line 752
    .local v0, "currentPermissions":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    invoke-virtual {p1}, Lcom/facebook/AuthorizationClient$AuthorizationRequest;->getPermissions()Ljava/util/List;

    move-result-object v4

    .line 753
    .local v4, "permissions":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    if-eqz v0, :cond_32

    .line 754
    if-eqz v4, :cond_1e

    invoke-virtual {v0, v4}, Ljava/util/ArrayList;->containsAll(Ljava/util/Collection;)Z

    move-result v6

    if-eqz v6, :cond_32

    .line 757
    :cond_1e
    sget-object v6, Lcom/facebook/AccessTokenSource;->FACEBOOK_APPLICATION_SERVICE:Lcom/facebook/AccessTokenSource;

    invoke-static {p2, v6}, Lcom/facebook/AccessToken;->createFromNativeLogin(Landroid/os/Bundle;Lcom/facebook/AccessTokenSource;)Lcom/facebook/AccessToken;

    move-result-object v5

    .line 758
    .local v5, "token":Lcom/facebook/AccessToken;
    iget-object v6, p0, Lcom/facebook/AuthorizationClient$GetTokenAuthHandler;->this$0:Lcom/facebook/AuthorizationClient;

    iget-object v6, v6, Lcom/facebook/AuthorizationClient;->pendingRequest:Lcom/facebook/AuthorizationClient$AuthorizationRequest;

    invoke-static {v6, v5}, Lcom/facebook/AuthorizationClient$Result;->createTokenResult(Lcom/facebook/AuthorizationClient$AuthorizationRequest;Lcom/facebook/AccessToken;)Lcom/facebook/AuthorizationClient$Result;

    move-result-object v2

    .line 759
    .local v2, "outcome":Lcom/facebook/AuthorizationClient$Result;
    iget-object v6, p0, Lcom/facebook/AuthorizationClient$GetTokenAuthHandler;->this$0:Lcom/facebook/AuthorizationClient;

    invoke-virtual {v6, v2}, Lcom/facebook/AuthorizationClient;->completeAndValidate(Lcom/facebook/AuthorizationClient$Result;)V

    .line 779
    .end local v0    # "currentPermissions":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    .end local v2    # "outcome":Lcom/facebook/AuthorizationClient$Result;
    .end local v4    # "permissions":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .end local v5    # "token":Lcom/facebook/AccessToken;
    :goto_31
    return-void

    .line 765
    .restart local v0    # "currentPermissions":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    .restart local v4    # "permissions":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    :cond_32
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 766
    .local v1, "newPermissions":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    invoke-interface {v4}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v6

    :cond_3b
    :goto_3b
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-nez v7, :cond_5b

    .line 771
    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z

    move-result v6

    if-nez v6, :cond_52

    .line 772
    const-string v6, "new_permissions"

    const-string v7, ","

    invoke-static {v7, v1}, Landroid/text/TextUtils;->join(Ljava/lang/CharSequence;Ljava/lang/Iterable;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {p0, v6, v7}, Lcom/facebook/AuthorizationClient$GetTokenAuthHandler;->addLoggingExtra(Ljava/lang/String;Ljava/lang/Object;)V

    .line 775
    :cond_52
    invoke-virtual {p1, v1}, Lcom/facebook/AuthorizationClient$AuthorizationRequest;->setPermissions(Ljava/util/List;)V

    .line 778
    .end local v0    # "currentPermissions":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    .end local v1    # "newPermissions":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .end local v4    # "permissions":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    :cond_55
    iget-object v6, p0, Lcom/facebook/AuthorizationClient$GetTokenAuthHandler;->this$0:Lcom/facebook/AuthorizationClient;

    invoke-virtual {v6}, Lcom/facebook/AuthorizationClient;->tryNextHandler()V

    goto :goto_31

    .line 766
    .restart local v0    # "currentPermissions":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    .restart local v1    # "newPermissions":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .restart local v4    # "permissions":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    :cond_5b
    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    .line 767
    .local v3, "permission":Ljava/lang/String;
    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_3b

    .line 768
    invoke-interface {v1, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_3b
.end method

.method needsRestart()Z
    .registers 2

    .prologue
    .line 723
    iget-object v0, p0, Lcom/facebook/AuthorizationClient$GetTokenAuthHandler;->getTokenClient:Lcom/facebook/GetTokenClient;

    if-nez v0, :cond_6

    const/4 v0, 0x1

    :goto_5
    return v0

    :cond_6
    const/4 v0, 0x0

    goto :goto_5
.end method

.method tryAuthorize(Lcom/facebook/AuthorizationClient$AuthorizationRequest;)Z
    .registers 6
    .param p1, "request"    # Lcom/facebook/AuthorizationClient$AuthorizationRequest;

    .prologue
    .line 727
    new-instance v1, Lcom/facebook/GetTokenClient;

    iget-object v2, p0, Lcom/facebook/AuthorizationClient$GetTokenAuthHandler;->this$0:Lcom/facebook/AuthorizationClient;

    iget-object v2, v2, Lcom/facebook/AuthorizationClient;->context:Landroid/content/Context;

    invoke-virtual {p1}, Lcom/facebook/AuthorizationClient$AuthorizationRequest;->getApplicationId()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v1, v2, v3}, Lcom/facebook/GetTokenClient;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    iput-object v1, p0, Lcom/facebook/AuthorizationClient$GetTokenAuthHandler;->getTokenClient:Lcom/facebook/GetTokenClient;

    .line 728
    iget-object v1, p0, Lcom/facebook/AuthorizationClient$GetTokenAuthHandler;->getTokenClient:Lcom/facebook/GetTokenClient;

    invoke-virtual {v1}, Lcom/facebook/GetTokenClient;->start()Z

    move-result v1

    if-nez v1, :cond_19

    .line 729
    const/4 v1, 0x0

    .line 742
    :goto_18
    return v1

    .line 732
    :cond_19
    iget-object v1, p0, Lcom/facebook/AuthorizationClient$GetTokenAuthHandler;->this$0:Lcom/facebook/AuthorizationClient;

    # invokes: Lcom/facebook/AuthorizationClient;->notifyBackgroundProcessingStart()V
    invoke-static {v1}, Lcom/facebook/AuthorizationClient;->access$2(Lcom/facebook/AuthorizationClient;)V

    .line 734
    new-instance v0, Lcom/facebook/AuthorizationClient$GetTokenAuthHandler$1;

    invoke-direct {v0, p0, p1}, Lcom/facebook/AuthorizationClient$GetTokenAuthHandler$1;-><init>(Lcom/facebook/AuthorizationClient$GetTokenAuthHandler;Lcom/facebook/AuthorizationClient$AuthorizationRequest;)V

    .line 741
    .local v0, "callback":Lcom/facebook/internal/PlatformServiceClient$CompletedListener;
    iget-object v1, p0, Lcom/facebook/AuthorizationClient$GetTokenAuthHandler;->getTokenClient:Lcom/facebook/GetTokenClient;

    invoke-virtual {v1, v0}, Lcom/facebook/GetTokenClient;->setCompletedListener(Lcom/facebook/internal/PlatformServiceClient$CompletedListener;)V

    .line 742
    const/4 v1, 0x1

    goto :goto_18
.end method
