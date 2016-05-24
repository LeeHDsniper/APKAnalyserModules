.class Lcom/facebook/Session$AuthorizationRequest$1;
.super Ljava/lang/Object;
.source "Session.java"

# interfaces
.implements Lcom/facebook/Session$StartActivityDelegate;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/facebook/Session$AuthorizationRequest;-><init>(Landroid/app/Activity;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/facebook/Session$AuthorizationRequest;

.field private final synthetic val$activity:Landroid/app/Activity;


# direct methods
.method constructor <init>(Lcom/facebook/Session$AuthorizationRequest;Landroid/app/Activity;)V
    .registers 3

    .prologue
    .line 1
    iput-object p1, p0, Lcom/facebook/Session$AuthorizationRequest$1;->this$1:Lcom/facebook/Session$AuthorizationRequest;

    iput-object p2, p0, Lcom/facebook/Session$AuthorizationRequest$1;->val$activity:Landroid/app/Activity;

    .line 1899
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getActivityContext()Landroid/app/Activity;
    .registers 2

    .prologue
    .line 1907
    iget-object v0, p0, Lcom/facebook/Session$AuthorizationRequest$1;->val$activity:Landroid/app/Activity;

    return-object v0
.end method

.method public startActivityForResult(Landroid/content/Intent;I)V
    .registers 4
    .param p1, "intent"    # Landroid/content/Intent;
    .param p2, "requestCode"    # I

    .prologue
    .line 1902
    iget-object v0, p0, Lcom/facebook/Session$AuthorizationRequest$1;->val$activity:Landroid/app/Activity;

    invoke-virtual {v0, p1, p2}, Landroid/app/Activity;->startActivityForResult(Landroid/content/Intent;I)V

    .line 1903
    return-void
.end method
