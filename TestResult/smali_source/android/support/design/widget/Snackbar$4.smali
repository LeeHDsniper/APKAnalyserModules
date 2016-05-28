.class Landroid/support/design/widget/Snackbar$4;
.super Ljava/lang/Object;
.source "Snackbar.java"

# interfaces
.implements Landroid/support/design/widget/SwipeDismissBehavior$OnDismissListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Landroid/support/design/widget/Snackbar;->showView()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Landroid/support/design/widget/Snackbar;


# direct methods
.method constructor <init>(Landroid/support/design/widget/Snackbar;)V
    .registers 2

    .prologue
    .line 348
    iput-object p1, p0, Landroid/support/design/widget/Snackbar$4;->this$0:Landroid/support/design/widget/Snackbar;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onDismiss(Landroid/view/View;)V
    .registers 3
    .param p1, "view"    # Landroid/view/View;

    .prologue
    .line 351
    iget-object v0, p0, Landroid/support/design/widget/Snackbar$4;->this$0:Landroid/support/design/widget/Snackbar;

    invoke-virtual {v0}, Landroid/support/design/widget/Snackbar;->dismiss()V

    .line 352
    return-void
.end method

.method public onDragStateChanged(I)V
    .registers 4
    .param p1, "state"    # I

    .prologue
    .line 356
    packed-switch p1, :pswitch_data_20

    .line 367
    :goto_3
    return-void

    .line 360
    :pswitch_4
    invoke-static {}, Landroid/support/design/widget/SnackbarManager;->getInstance()Landroid/support/design/widget/SnackbarManager;

    move-result-object v0

    iget-object v1, p0, Landroid/support/design/widget/Snackbar$4;->this$0:Landroid/support/design/widget/Snackbar;

    # getter for: Landroid/support/design/widget/Snackbar;->mManagerCallback:Landroid/support/design/widget/SnackbarManager$Callback;
    invoke-static {v1}, Landroid/support/design/widget/Snackbar;->access$100(Landroid/support/design/widget/Snackbar;)Landroid/support/design/widget/SnackbarManager$Callback;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/support/design/widget/SnackbarManager;->cancelTimeout(Landroid/support/design/widget/SnackbarManager$Callback;)V

    goto :goto_3

    .line 364
    :pswitch_12
    invoke-static {}, Landroid/support/design/widget/SnackbarManager;->getInstance()Landroid/support/design/widget/SnackbarManager;

    move-result-object v0

    iget-object v1, p0, Landroid/support/design/widget/Snackbar$4;->this$0:Landroid/support/design/widget/Snackbar;

    # getter for: Landroid/support/design/widget/Snackbar;->mManagerCallback:Landroid/support/design/widget/SnackbarManager$Callback;
    invoke-static {v1}, Landroid/support/design/widget/Snackbar;->access$100(Landroid/support/design/widget/Snackbar;)Landroid/support/design/widget/SnackbarManager$Callback;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/support/design/widget/SnackbarManager;->restoreTimeout(Landroid/support/design/widget/SnackbarManager$Callback;)V

    goto :goto_3

    .line 356
    :pswitch_data_20
    .packed-switch 0x0
        :pswitch_12
        :pswitch_4
        :pswitch_4
    .end packed-switch
.end method
