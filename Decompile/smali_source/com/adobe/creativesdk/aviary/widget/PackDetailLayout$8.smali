.class Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout$8;
.super Ljava/lang/Object;
.source "PackDetailLayout.java"

# interfaces
.implements Lrx/functions/Action1;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout;->purchasePackItem(JLjava/lang/String;Ljava/lang/String;Ljava/lang/String;I)V
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
.field final synthetic this$0:Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout;


# direct methods
.method constructor <init>(Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout;)V
    .registers 2
    .param p1, "this$0"    # Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout;

    .prologue
    .line 716
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout$8;->this$0:Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic call(Ljava/lang/Object;)V
    .registers 2

    .prologue
    .line 716
    check-cast p1, Ljava/lang/Throwable;

    invoke-virtual {p0, p1}, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout$8;->call(Ljava/lang/Throwable;)V

    return-void
.end method

.method public call(Ljava/lang/Throwable;)V
    .registers 8
    .param p1, "throwable"    # Ljava/lang/Throwable;

    .prologue
    const/4 v5, 0x1

    const/4 v4, 0x0

    .line 719
    sget-object v0, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v1, "purchasePackItem.onError: %s"

    new-array v2, v5, [Ljava/lang/Object;

    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v3

    aput-object v3, v2, v4

    invoke-interface {v0, v1, v2}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->error(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 720
    sget-object v0, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v1, "current thread: %s"

    new-array v2, v5, [Ljava/lang/Object;

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v3

    aput-object v3, v2, v4

    invoke-interface {v0, v1, v2}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->verbose(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 721
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout$8;->this$0:Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1, v4}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 722
    return-void
.end method
