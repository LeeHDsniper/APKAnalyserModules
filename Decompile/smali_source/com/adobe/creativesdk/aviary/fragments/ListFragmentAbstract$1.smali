.class Lcom/adobe/creativesdk/aviary/fragments/ListFragmentAbstract$1;
.super Ljava/lang/Object;
.source "ListFragmentAbstract.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/adobe/creativesdk/aviary/fragments/ListFragmentAbstract;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/adobe/creativesdk/aviary/fragments/ListFragmentAbstract;


# direct methods
.method constructor <init>(Lcom/adobe/creativesdk/aviary/fragments/ListFragmentAbstract;)V
    .registers 2
    .param p1, "this$0"    # Lcom/adobe/creativesdk/aviary/fragments/ListFragmentAbstract;

    .prologue
    .line 29
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/fragments/ListFragmentAbstract$1;->this$0:Lcom/adobe/creativesdk/aviary/fragments/ListFragmentAbstract;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 3

    .prologue
    .line 31
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/fragments/ListFragmentAbstract$1;->this$0:Lcom/adobe/creativesdk/aviary/fragments/ListFragmentAbstract;

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/fragments/ListFragmentAbstract;->mList:Landroid/widget/ListView;

    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/fragments/ListFragmentAbstract$1;->this$0:Lcom/adobe/creativesdk/aviary/fragments/ListFragmentAbstract;

    iget-object v1, v1, Lcom/adobe/creativesdk/aviary/fragments/ListFragmentAbstract;->mList:Landroid/widget/ListView;

    invoke-virtual {v0, v1}, Landroid/widget/ListView;->focusableViewAvailable(Landroid/view/View;)V

    .line 32
    return-void
.end method
