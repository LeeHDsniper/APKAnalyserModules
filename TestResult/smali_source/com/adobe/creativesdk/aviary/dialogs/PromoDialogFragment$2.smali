.class Lcom/adobe/creativesdk/aviary/dialogs/PromoDialogFragment$2;
.super Ljava/lang/Object;
.source "PromoDialogFragment.java"

# interfaces
.implements Lrx/functions/Action1;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/adobe/creativesdk/aviary/dialogs/PromoDialogFragment;->onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lrx/functions/Action1",
        "<",
        "Ljava/lang/Throwable;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/adobe/creativesdk/aviary/dialogs/PromoDialogFragment;


# direct methods
.method constructor <init>(Lcom/adobe/creativesdk/aviary/dialogs/PromoDialogFragment;)V
    .registers 2
    .param p1, "this$0"    # Lcom/adobe/creativesdk/aviary/dialogs/PromoDialogFragment;

    .prologue
    .line 138
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/dialogs/PromoDialogFragment$2;->this$0:Lcom/adobe/creativesdk/aviary/dialogs/PromoDialogFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic call(Ljava/lang/Object;)V
    .registers 2

    .prologue
    .line 138
    check-cast p1, Ljava/lang/Throwable;

    invoke-virtual {p0, p1}, Lcom/adobe/creativesdk/aviary/dialogs/PromoDialogFragment$2;->call(Ljava/lang/Throwable;)V

    return-void
.end method

.method public call(Ljava/lang/Throwable;)V
    .registers 3
    .param p1, "throwable"    # Ljava/lang/Throwable;

    .prologue
    .line 141
    invoke-virtual {p1}, Ljava/lang/Throwable;->printStackTrace()V

    .line 142
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/dialogs/PromoDialogFragment$2;->this$0:Lcom/adobe/creativesdk/aviary/dialogs/PromoDialogFragment;

    # invokes: Lcom/adobe/creativesdk/aviary/dialogs/PromoDialogFragment;->onSetupError(Ljava/lang/Throwable;)V
    invoke-static {v0, p1}, Lcom/adobe/creativesdk/aviary/dialogs/PromoDialogFragment;->access$000(Lcom/adobe/creativesdk/aviary/dialogs/PromoDialogFragment;Ljava/lang/Throwable;)V

    .line 143
    return-void
.end method
