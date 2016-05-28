.class Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment$7;
.super Ljava/lang/Object;
.source "StoreListFragment.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment;->onAskToLogin()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment;


# direct methods
.method constructor <init>(Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment;)V
    .registers 2
    .param p1, "this$0"    # Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment;

    .prologue
    .line 343
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment$7;->this$0:Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .registers 4
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "which"    # I

    .prologue
    .line 346
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment$7;->this$0:Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment;

    # invokes: Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment;->onRestoreAllInternal()V
    invoke-static {v0}, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment;->access$000(Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment;)V

    .line 347
    return-void
.end method
