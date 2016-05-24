.class Lcom/localytics/android/AmpSessionHandler$8;
.super Lcom/localytics/android/AmpCallable;
.source "AmpSessionHandler.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/localytics/android/AmpSessionHandler;->showAmpTest()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/localytics/android/AmpSessionHandler;


# direct methods
.method constructor <init>(Lcom/localytics/android/AmpSessionHandler;)V
    .registers 2

    .prologue
    .line 468
    iput-object p1, p0, Lcom/localytics/android/AmpSessionHandler$8;->this$0:Lcom/localytics/android/AmpSessionHandler;

    invoke-direct {p0}, Lcom/localytics/android/AmpCallable;-><init>()V

    return-void
.end method


# virtual methods
.method call([Ljava/lang/Object;)Ljava/lang/Object;
    .registers 6
    .param p1, "params"    # [Ljava/lang/Object;

    .prologue
    const/4 v3, 0x0

    .line 472
    aget-object v0, p1, v3

    check-cast v0, Ljava/util/Map;

    .line 474
    .local v0, "ampMessage":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    new-instance v1, Lcom/localytics/android/AmpSessionHandler$8$1;

    invoke-direct {v1, p0, v0}, Lcom/localytics/android/AmpSessionHandler$8$1;-><init>(Lcom/localytics/android/AmpSessionHandler$8;Ljava/util/Map;)V

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/util/Map;

    aput-object v0, v2, v3

    invoke-virtual {v1, v2}, Lcom/localytics/android/AmpSessionHandler$8$1;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    .line 536
    const/4 v1, 0x0

    return-object v1
.end method
