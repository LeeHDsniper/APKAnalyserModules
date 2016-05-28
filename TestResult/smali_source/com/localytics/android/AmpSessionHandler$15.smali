.class Lcom/localytics/android/AmpSessionHandler$15;
.super Lcom/localytics/android/AmpCallable;
.source "AmpSessionHandler.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/localytics/android/AmpSessionHandler;->getJavaScriptClientCallbacks(Ljava/util/Map;)Ljava/util/Map;
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
    .line 977
    iput-object p1, p0, Lcom/localytics/android/AmpSessionHandler$15;->this$0:Lcom/localytics/android/AmpSessionHandler;

    invoke-direct {p0}, Lcom/localytics/android/AmpCallable;-><init>()V

    return-void
.end method


# virtual methods
.method call([Ljava/lang/Object;)Ljava/lang/Object;
    .registers 5
    .param p1, "params"    # [Ljava/lang/Object;

    .prologue
    .line 981
    const/4 v2, 0x0

    aget-object v2, p1, v2

    check-cast v2, Ljava/lang/Integer;

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v0

    .line 982
    .local v0, "dimension":I
    const/4 v2, 0x1

    aget-object v1, p1, v2

    check-cast v1, Ljava/lang/String;

    .line 983
    .local v1, "value":Ljava/lang/String;
    iget-object v2, p0, Lcom/localytics/android/AmpSessionHandler$15;->this$0:Lcom/localytics/android/AmpSessionHandler;

    invoke-virtual {v2, v0, v1}, Lcom/localytics/android/AmpSessionHandler;->setCustomDimension(ILjava/lang/String;)V

    .line 985
    const/4 v2, 0x0

    return-object v2
.end method
