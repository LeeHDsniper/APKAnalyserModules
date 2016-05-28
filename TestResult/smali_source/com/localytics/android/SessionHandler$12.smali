.class Lcom/localytics/android/SessionHandler$12;
.super Ljava/lang/Object;
.source "SessionHandler.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/localytics/android/SessionHandler;->handleMessage(Landroid/os/Message;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/localytics/android/SessionHandler;

.field final synthetic val$action:I

.field final synthetic val$attributeJSON:Lorg/json/JSONObject;

.field final synthetic val$customerID:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/localytics/android/SessionHandler;Lorg/json/JSONObject;ILjava/lang/String;)V
    .registers 5

    .prologue
    .line 796
    iput-object p1, p0, Lcom/localytics/android/SessionHandler$12;->this$0:Lcom/localytics/android/SessionHandler;

    iput-object p2, p0, Lcom/localytics/android/SessionHandler$12;->val$attributeJSON:Lorg/json/JSONObject;

    iput p3, p0, Lcom/localytics/android/SessionHandler$12;->val$action:I

    iput-object p4, p0, Lcom/localytics/android/SessionHandler$12;->val$customerID:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 4

    .prologue
    .line 800
    new-instance v0, Landroid/content/ContentValues;

    invoke-direct {v0}, Landroid/content/ContentValues;-><init>()V

    .line 801
    .local v0, "values":Landroid/content/ContentValues;
    const-string v1, "attribute"

    iget-object v2, p0, Lcom/localytics/android/SessionHandler$12;->val$attributeJSON:Lorg/json/JSONObject;

    invoke-virtual {v2}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 802
    const-string v1, "action"

    iget v2, p0, Lcom/localytics/android/SessionHandler$12;->val$action:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 803
    const-string v1, "customer_id"

    iget-object v2, p0, Lcom/localytics/android/SessionHandler$12;->val$customerID:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 804
    iget-object v1, p0, Lcom/localytics/android/SessionHandler$12;->this$0:Lcom/localytics/android/SessionHandler;

    iget-object v1, v1, Lcom/localytics/android/SessionHandler;->mProvider:Lcom/localytics/android/LocalyticsProvider;

    const-string v2, "profile"

    invoke-virtual {v1, v2, v0}, Lcom/localytics/android/LocalyticsProvider;->insert(Ljava/lang/String;Landroid/content/ContentValues;)J

    .line 805
    return-void
.end method
