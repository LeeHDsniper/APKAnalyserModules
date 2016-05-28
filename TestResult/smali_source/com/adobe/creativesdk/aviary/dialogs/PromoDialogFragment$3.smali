.class Lcom/adobe/creativesdk/aviary/dialogs/PromoDialogFragment$3;
.super Ljava/lang/Object;
.source "PromoDialogFragment.java"

# interfaces
.implements Lrx/functions/Action1;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/adobe/creativesdk/aviary/dialogs/PromoDialogFragment;->onSetupDone(Landroid/util/Pair;)V
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
        "Lcom/adobe/creativesdk/aviary/internal/AdobeAccountUserStatus;",
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
    .line 180
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/dialogs/PromoDialogFragment$3;->this$0:Lcom/adobe/creativesdk/aviary/dialogs/PromoDialogFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public call(Lcom/adobe/creativesdk/aviary/internal/AdobeAccountUserStatus;)V
    .registers 3
    .param p1, "userStatus"    # Lcom/adobe/creativesdk/aviary/internal/AdobeAccountUserStatus;

    .prologue
    .line 183
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/dialogs/PromoDialogFragment$3;->this$0:Lcom/adobe/creativesdk/aviary/dialogs/PromoDialogFragment;

    invoke-virtual {v0, p1}, Lcom/adobe/creativesdk/aviary/dialogs/PromoDialogFragment;->onUserAuthenticated(Lcom/adobe/creativesdk/aviary/internal/AdobeAccountUserStatus;)V

    .line 184
    return-void
.end method

.method public bridge synthetic call(Ljava/lang/Object;)V
    .registers 2

    .prologue
    .line 180
    check-cast p1, Lcom/adobe/creativesdk/aviary/internal/AdobeAccountUserStatus;

    invoke-virtual {p0, p1}, Lcom/adobe/creativesdk/aviary/dialogs/PromoDialogFragment$3;->call(Lcom/adobe/creativesdk/aviary/internal/AdobeAccountUserStatus;)V

    return-void
.end method
