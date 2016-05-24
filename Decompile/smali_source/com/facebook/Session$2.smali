.class Lcom/facebook/Session$2;
.super Ljava/lang/Object;
.source "Session.java"

# interfaces
.implements Lcom/facebook/Request$Callback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/facebook/Session;->refreshPermissions()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/facebook/Session;


# direct methods
.method constructor <init>(Lcom/facebook/Session;)V
    .registers 2

    .prologue
    .line 1
    iput-object p1, p0, Lcom/facebook/Session$2;->this$0:Lcom/facebook/Session;

    .line 610
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onCompleted(Lcom/facebook/Response;)V
    .registers 8
    .param p1, "response"    # Lcom/facebook/Response;

    .prologue
    .line 613
    invoke-static {p1}, Lcom/facebook/Session;->handlePermissionResponse(Lcom/facebook/Response;)Lcom/facebook/Session$PermissionsPair;

    move-result-object v0

    .line 614
    .local v0, "permissionsPair":Lcom/facebook/Session$PermissionsPair;
    if-eqz v0, :cond_33

    .line 616
    iget-object v1, p0, Lcom/facebook/Session$2;->this$0:Lcom/facebook/Session;

    # getter for: Lcom/facebook/Session;->lock:Ljava/lang/Object;
    invoke-static {v1}, Lcom/facebook/Session;->access$6(Lcom/facebook/Session;)Ljava/lang/Object;

    move-result-object v2

    monitor-enter v2

    .line 617
    :try_start_d
    iget-object v1, p0, Lcom/facebook/Session$2;->this$0:Lcom/facebook/Session;

    iget-object v3, p0, Lcom/facebook/Session$2;->this$0:Lcom/facebook/Session;

    # getter for: Lcom/facebook/Session;->tokenInfo:Lcom/facebook/AccessToken;
    invoke-static {v3}, Lcom/facebook/Session;->access$7(Lcom/facebook/Session;)Lcom/facebook/AccessToken;

    move-result-object v3

    .line 618
    invoke-virtual {v0}, Lcom/facebook/Session$PermissionsPair;->getGrantedPermissions()Ljava/util/List;

    move-result-object v4

    invoke-virtual {v0}, Lcom/facebook/Session$PermissionsPair;->getDeclinedPermissions()Ljava/util/List;

    move-result-object v5

    .line 617
    invoke-static {v3, v4, v5}, Lcom/facebook/AccessToken;->createFromTokenWithRefreshedPermissions(Lcom/facebook/AccessToken;Ljava/util/List;Ljava/util/List;)Lcom/facebook/AccessToken;

    move-result-object v3

    invoke-static {v1, v3}, Lcom/facebook/Session;->access$8(Lcom/facebook/Session;Lcom/facebook/AccessToken;)V

    .line 619
    iget-object v1, p0, Lcom/facebook/Session$2;->this$0:Lcom/facebook/Session;

    iget-object v3, p0, Lcom/facebook/Session$2;->this$0:Lcom/facebook/Session;

    # getter for: Lcom/facebook/Session;->state:Lcom/facebook/SessionState;
    invoke-static {v3}, Lcom/facebook/Session;->access$9(Lcom/facebook/Session;)Lcom/facebook/SessionState;

    move-result-object v3

    sget-object v4, Lcom/facebook/SessionState;->OPENED_TOKEN_UPDATED:Lcom/facebook/SessionState;

    const/4 v5, 0x0

    invoke-virtual {v1, v3, v4, v5}, Lcom/facebook/Session;->postStateChange(Lcom/facebook/SessionState;Lcom/facebook/SessionState;Ljava/lang/Exception;)V

    .line 616
    monitor-exit v2

    .line 622
    :cond_33
    return-void

    .line 616
    :catchall_34
    move-exception v1

    monitor-exit v2
    :try_end_36
    .catchall {:try_start_d .. :try_end_36} :catchall_34

    throw v1
.end method
