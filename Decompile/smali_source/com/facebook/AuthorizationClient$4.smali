.class Lcom/facebook/AuthorizationClient$4;
.super Ljava/lang/Object;
.source "AuthorizationClient.java"

# interfaces
.implements Lcom/facebook/Request$Callback;


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

.field private final synthetic val$grantedPermissions:Ljava/util/ArrayList;


# direct methods
.method constructor <init>(Lcom/facebook/AuthorizationClient;Ljava/util/ArrayList;Ljava/util/ArrayList;)V
    .registers 4

    .prologue
    .line 1
    iput-object p1, p0, Lcom/facebook/AuthorizationClient$4;->this$0:Lcom/facebook/AuthorizationClient;

    iput-object p2, p0, Lcom/facebook/AuthorizationClient$4;->val$grantedPermissions:Ljava/util/ArrayList;

    iput-object p3, p0, Lcom/facebook/AuthorizationClient$4;->val$declinedPermissions:Ljava/util/ArrayList;

    .line 390
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onCompleted(Lcom/facebook/Response;)V
    .registers 5
    .param p1, "response"    # Lcom/facebook/Response;

    .prologue
    .line 394
    :try_start_0
    invoke-static {p1}, Lcom/facebook/Session;->handlePermissionResponse(Lcom/facebook/Response;)Lcom/facebook/Session$PermissionsPair;

    move-result-object v0

    .line 395
    .local v0, "permissionsPair":Lcom/facebook/Session$PermissionsPair;
    if-eqz v0, :cond_18

    .line 396
    iget-object v1, p0, Lcom/facebook/AuthorizationClient$4;->val$grantedPermissions:Ljava/util/ArrayList;

    invoke-virtual {v0}, Lcom/facebook/Session$PermissionsPair;->getGrantedPermissions()Ljava/util/List;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 397
    iget-object v1, p0, Lcom/facebook/AuthorizationClient$4;->val$declinedPermissions:Ljava/util/ArrayList;

    invoke-virtual {v0}, Lcom/facebook/Session$PermissionsPair;->getDeclinedPermissions()Ljava/util/List;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z
    :try_end_18
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_18} :catch_19

    .line 401
    .end local v0    # "permissionsPair":Lcom/facebook/Session$PermissionsPair;
    :cond_18
    :goto_18
    return-void

    .line 399
    :catch_19
    move-exception v1

    goto :goto_18
.end method
