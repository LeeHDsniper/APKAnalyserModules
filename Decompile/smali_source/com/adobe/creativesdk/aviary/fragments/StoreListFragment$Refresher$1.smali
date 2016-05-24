.class Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment$Refresher$1;
.super Ljava/lang/Object;
.source "StoreListFragment.java"

# interfaces
.implements Lrx/functions/Func1;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment$Refresher;->execute()Lrx/Subscriber;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lrx/functions/Func1",
        "<",
        "Landroid/database/Cursor;",
        "Lrx/Observable",
        "<*>;>;"
    }
.end annotation


# instance fields
.field final synthetic this$1:Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment$Refresher;


# direct methods
.method constructor <init>(Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment$Refresher;)V
    .registers 2
    .param p1, "this$1"    # Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment$Refresher;

    .prologue
    .line 777
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment$Refresher$1;->this$1:Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment$Refresher;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic call(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 3

    .prologue
    .line 777
    check-cast p1, Landroid/database/Cursor;

    invoke-virtual {p0, p1}, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment$Refresher$1;->call(Landroid/database/Cursor;)Lrx/Observable;

    move-result-object v0

    return-object v0
.end method

.method public call(Landroid/database/Cursor;)Lrx/Observable;
    .registers 3
    .param p1, "cursor"    # Landroid/database/Cursor;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/database/Cursor;",
            ")",
            "Lrx/Observable",
            "<*>;"
        }
    .end annotation

    .prologue
    .line 780
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment$Refresher$1;->this$1:Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment$Refresher;

    # invokes: Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment$Refresher;->generatePurchaseMap(Landroid/database/Cursor;)Lrx/Observable;
    invoke-static {v0, p1}, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment$Refresher;->access$200(Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment$Refresher;Landroid/database/Cursor;)Lrx/Observable;

    move-result-object v0

    return-object v0
.end method
