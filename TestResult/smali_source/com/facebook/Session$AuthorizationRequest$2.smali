.class Lcom/facebook/Session$AuthorizationRequest$2;
.super Ljava/lang/Object;
.source "Session.java"

# interfaces
.implements Lcom/facebook/Session$StartActivityDelegate;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/facebook/Session$AuthorizationRequest;-><init>(Landroid/support/v4/app/Fragment;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/facebook/Session$AuthorizationRequest;

.field private final synthetic val$fragment:Landroid/support/v4/app/Fragment;


# direct methods
.method constructor <init>(Lcom/facebook/Session$AuthorizationRequest;Landroid/support/v4/app/Fragment;)V
    .registers 3

    .prologue
    .line 1
    iput-object p1, p0, Lcom/facebook/Session$AuthorizationRequest$2;->this$1:Lcom/facebook/Session$AuthorizationRequest;

    iput-object p2, p0, Lcom/facebook/Session$AuthorizationRequest$2;->val$fragment:Landroid/support/v4/app/Fragment;

    .line 1913
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getActivityContext()Landroid/app/Activity;
    .registers 2

    .prologue
    .line 1921
    iget-object v0, p0, Lcom/facebook/Session$AuthorizationRequest$2;->val$fragment:Landroid/support/v4/app/Fragment;

    invoke-virtual {v0}, Landroid/support/v4/app/Fragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    return-object v0
.end method

.method public startActivityForResult(Landroid/content/Intent;I)V
    .registers 4
    .param p1, "intent"    # Landroid/content/Intent;
    .param p2, "requestCode"    # I

    .prologue
    .line 1916
    iget-object v0, p0, Lcom/facebook/Session$AuthorizationRequest$2;->val$fragment:Landroid/support/v4/app/Fragment;

    invoke-virtual {v0, p1, p2}, Landroid/support/v4/app/Fragment;->startActivityForResult(Landroid/content/Intent;I)V

    .line 1917
    return-void
.end method
