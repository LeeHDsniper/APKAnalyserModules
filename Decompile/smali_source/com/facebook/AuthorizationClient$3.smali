.class Lcom/facebook/AuthorizationClient$3;
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

.field private final synthetic val$fbids:Ljava/util/ArrayList;


# direct methods
.method constructor <init>(Lcom/facebook/AuthorizationClient;Ljava/util/ArrayList;)V
    .registers 3

    .prologue
    .line 1
    iput-object p1, p0, Lcom/facebook/AuthorizationClient$3;->this$0:Lcom/facebook/AuthorizationClient;

    iput-object p2, p0, Lcom/facebook/AuthorizationClient$3;->val$fbids:Ljava/util/ArrayList;

    .line 369
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onCompleted(Lcom/facebook/Response;)V
    .registers 5
    .param p1, "response"    # Lcom/facebook/Response;

    .prologue
    .line 373
    :try_start_0
    const-class v1, Lcom/facebook/model/GraphUser;

    invoke-virtual {p1, v1}, Lcom/facebook/Response;->getGraphObjectAs(Ljava/lang/Class;)Lcom/facebook/model/GraphObject;

    move-result-object v0

    check-cast v0, Lcom/facebook/model/GraphUser;

    .line 374
    .local v0, "user":Lcom/facebook/model/GraphUser;
    if-eqz v0, :cond_13

    .line 375
    iget-object v1, p0, Lcom/facebook/AuthorizationClient$3;->val$fbids:Ljava/util/ArrayList;

    invoke-interface {v0}, Lcom/facebook/model/GraphUser;->getId()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_13
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_13} :catch_14

    .line 379
    .end local v0    # "user":Lcom/facebook/model/GraphUser;
    :cond_13
    :goto_13
    return-void

    .line 377
    :catch_14
    move-exception v1

    goto :goto_13
.end method
