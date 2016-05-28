.class Lcom/facebook/Session$AuthorizationRequest$4;
.super Ljava/lang/Object;
.source "Session.java"

# interfaces
.implements Lcom/facebook/AuthorizationClient$StartActivityDelegate;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/facebook/Session$AuthorizationRequest;->getAuthorizationClientRequest()Lcom/facebook/AuthorizationClient$AuthorizationRequest;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/facebook/Session$AuthorizationRequest;


# direct methods
.method constructor <init>(Lcom/facebook/Session$AuthorizationRequest;)V
    .registers 2

    .prologue
    .line 1
    iput-object p1, p0, Lcom/facebook/Session$AuthorizationRequest$4;->this$1:Lcom/facebook/Session$AuthorizationRequest;

    .line 2049
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getActivityContext()Landroid/app/Activity;
    .registers 2

    .prologue
    .line 2057
    iget-object v0, p0, Lcom/facebook/Session$AuthorizationRequest$4;->this$1:Lcom/facebook/Session$AuthorizationRequest;

    # getter for: Lcom/facebook/Session$AuthorizationRequest;->startActivityDelegate:Lcom/facebook/Session$StartActivityDelegate;
    invoke-static {v0}, Lcom/facebook/Session$AuthorizationRequest;->access$1(Lcom/facebook/Session$AuthorizationRequest;)Lcom/facebook/Session$StartActivityDelegate;

    move-result-object v0

    invoke-interface {v0}, Lcom/facebook/Session$StartActivityDelegate;->getActivityContext()Landroid/app/Activity;

    move-result-object v0

    return-object v0
.end method

.method public startActivityForResult(Landroid/content/Intent;I)V
    .registers 4
    .param p1, "intent"    # Landroid/content/Intent;
    .param p2, "requestCode"    # I

    .prologue
    .line 2052
    iget-object v0, p0, Lcom/facebook/Session$AuthorizationRequest$4;->this$1:Lcom/facebook/Session$AuthorizationRequest;

    # getter for: Lcom/facebook/Session$AuthorizationRequest;->startActivityDelegate:Lcom/facebook/Session$StartActivityDelegate;
    invoke-static {v0}, Lcom/facebook/Session$AuthorizationRequest;->access$1(Lcom/facebook/Session$AuthorizationRequest;)Lcom/facebook/Session$StartActivityDelegate;

    move-result-object v0

    invoke-interface {v0, p1, p2}, Lcom/facebook/Session$StartActivityDelegate;->startActivityForResult(Landroid/content/Intent;I)V

    .line 2053
    return-void
.end method
