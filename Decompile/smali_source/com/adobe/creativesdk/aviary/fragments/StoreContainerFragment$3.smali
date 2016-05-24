.class Lcom/adobe/creativesdk/aviary/fragments/StoreContainerFragment$3;
.super Ljava/lang/Object;
.source "StoreContainerFragment.java"

# interfaces
.implements Lrx/functions/Action1;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/adobe/creativesdk/aviary/fragments/StoreContainerFragment;->connectIfNecessary()V
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
.field final synthetic this$0:Lcom/adobe/creativesdk/aviary/fragments/StoreContainerFragment;


# direct methods
.method constructor <init>(Lcom/adobe/creativesdk/aviary/fragments/StoreContainerFragment;)V
    .registers 2
    .param p1, "this$0"    # Lcom/adobe/creativesdk/aviary/fragments/StoreContainerFragment;

    .prologue
    .line 141
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/fragments/StoreContainerFragment$3;->this$0:Lcom/adobe/creativesdk/aviary/fragments/StoreContainerFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic call(Ljava/lang/Object;)V
    .registers 2

    .prologue
    .line 141
    check-cast p1, Ljava/lang/Throwable;

    invoke-virtual {p0, p1}, Lcom/adobe/creativesdk/aviary/fragments/StoreContainerFragment$3;->call(Ljava/lang/Throwable;)V

    return-void
.end method

.method public call(Ljava/lang/Throwable;)V
    .registers 5
    .param p1, "throwable"    # Ljava/lang/Throwable;

    .prologue
    .line 144
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/fragments/StoreContainerFragment$3;->this$0:Lcom/adobe/creativesdk/aviary/fragments/StoreContainerFragment;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/aviary/fragments/StoreContainerFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    invoke-static {v0, v1, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 145
    return-void
.end method
