.class Lcom/adobe/creativesdk/foundation/internal/PushNotification/controller/AdobeNotificationManager$10;
.super Ljava/lang/Object;
.source "AdobeNotificationManager.java"

# interfaces
.implements Lcom/adobe/creativesdk/foundation/internal/ans/delegates/IAdobeNotificationQueryCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/adobe/creativesdk/foundation/internal/PushNotification/controller/AdobeNotificationManager;->queryNotificationsByPage(JJI)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/adobe/creativesdk/foundation/internal/PushNotification/controller/AdobeNotificationManager;

.field final synthetic val$fromTimeStamp:J

.field final synthetic val$notificationCount:I


# direct methods
.method constructor <init>(Lcom/adobe/creativesdk/foundation/internal/PushNotification/controller/AdobeNotificationManager;IJ)V
    .registers 6
    .param p1, "this$0"    # Lcom/adobe/creativesdk/foundation/internal/PushNotification/controller/AdobeNotificationManager;

    .prologue
    .line 700
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/PushNotification/controller/AdobeNotificationManager$10;->this$0:Lcom/adobe/creativesdk/foundation/internal/PushNotification/controller/AdobeNotificationManager;

    iput p2, p0, Lcom/adobe/creativesdk/foundation/internal/PushNotification/controller/AdobeNotificationManager$10;->val$notificationCount:I

    iput-wide p3, p0, Lcom/adobe/creativesdk/foundation/internal/PushNotification/controller/AdobeNotificationManager$10;->val$fromTimeStamp:J

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onError()V
    .registers 3

    .prologue
    .line 731
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/PushNotification/controller/AdobeNotificationManager$10;->this$0:Lcom/adobe/creativesdk/foundation/internal/PushNotification/controller/AdobeNotificationManager;

    const/4 v1, 0x0

    # invokes: Lcom/adobe/creativesdk/foundation/internal/PushNotification/controller/AdobeNotificationManager;->handleActivitiesRequests(Z)V
    invoke-static {v0, v1}, Lcom/adobe/creativesdk/foundation/internal/PushNotification/controller/AdobeNotificationManager;->access$1200(Lcom/adobe/creativesdk/foundation/internal/PushNotification/controller/AdobeNotificationManager;Z)V

    .line 732
    return-void
.end method

.method public onSuccess(Lorg/json/JSONObject;)V
    .registers 16
    .param p1, "notificationPayload"    # Lorg/json/JSONObject;

    .prologue
    .line 704
    const/4 v0, 0x0

    .line 705
    .local v0, "activitiesCount":I
    :try_start_1
    const-string v1, "notifications"

    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Lorg/json/JSONObject;

    .line 706
    .local v10, "temp":Lorg/json/JSONObject;
    const-string v1, "notification"

    invoke-virtual {v10, v1}, Lorg/json/JSONObject;->opt(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lorg/json/JSONArray;

    .line 707
    .local v8, "notificationsList":Lorg/json/JSONArray;
    if-eqz v8, :cond_6b

    invoke-virtual {v8}, Lorg/json/JSONArray;->length()I

    move-result v1

    if-eqz v1, :cond_6b

    .line 708
    # getter for: Lcom/adobe/creativesdk/foundation/internal/PushNotification/controller/AdobeNotificationManager;->_pushNotificationDataModel:Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationModel;
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/PushNotification/controller/AdobeNotificationManager;->access$900()Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationModel;

    move-result-object v1

    invoke-virtual {v1, v8}, Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationModel;->populateActivitiesList(Lorg/json/JSONArray;)Landroid/util/Pair;

    move-result-object v9

    .line 709
    .local v9, "returnedData":Landroid/util/Pair;, "Landroid/util/Pair<Ljava/lang/Long;Ljava/lang/Integer;>;"
    iget-object v1, v9, Landroid/util/Pair;->first:Ljava/lang/Object;

    check-cast v1, Ljava/lang/Long;

    invoke-virtual {v1}, Ljava/lang/Long;->longValue()J

    move-result-wide v2

    # setter for: Lcom/adobe/creativesdk/foundation/internal/PushNotification/controller/AdobeNotificationManager;->lastTimeStampFetched:J
    invoke-static {v2, v3}, Lcom/adobe/creativesdk/foundation/internal/PushNotification/controller/AdobeNotificationManager;->access$1102(J)J

    .line 710
    iget-object v1, v9, Landroid/util/Pair;->second:Ljava/lang/Object;

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v0

    .line 711
    # getter for: Lcom/adobe/creativesdk/foundation/internal/PushNotification/controller/AdobeNotificationManager;->lastTimeStampFetched:J
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/PushNotification/controller/AdobeNotificationManager;->access$1100()J

    move-result-wide v2

    const-wide/16 v4, 0x0

    cmp-long v1, v2, v4

    if-nez v1, :cond_45

    .line 712
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/PushNotification/controller/AdobeNotificationManager$10;->this$0:Lcom/adobe/creativesdk/foundation/internal/PushNotification/controller/AdobeNotificationManager;

    const/4 v2, 0x1

    # invokes: Lcom/adobe/creativesdk/foundation/internal/PushNotification/controller/AdobeNotificationManager;->handleActivitiesRequests(Z)V
    invoke-static {v1, v2}, Lcom/adobe/creativesdk/foundation/internal/PushNotification/controller/AdobeNotificationManager;->access$1200(Lcom/adobe/creativesdk/foundation/internal/PushNotification/controller/AdobeNotificationManager;Z)V

    .line 727
    .end local v8    # "notificationsList":Lorg/json/JSONArray;
    .end local v9    # "returnedData":Landroid/util/Pair;, "Landroid/util/Pair<Ljava/lang/Long;Ljava/lang/Integer;>;"
    .end local v10    # "temp":Lorg/json/JSONObject;
    :goto_44
    return-void

    .line 715
    .restart local v8    # "notificationsList":Lorg/json/JSONArray;
    .restart local v9    # "returnedData":Landroid/util/Pair;, "Landroid/util/Pair<Ljava/lang/Long;Ljava/lang/Integer;>;"
    .restart local v10    # "temp":Lorg/json/JSONObject;
    :cond_45
    iget v1, p0, Lcom/adobe/creativesdk/foundation/internal/PushNotification/controller/AdobeNotificationManager$10;->val$notificationCount:I

    sub-int/2addr v1, v0

    if-nez v1, :cond_59

    .line 716
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/PushNotification/controller/AdobeNotificationManager$10;->this$0:Lcom/adobe/creativesdk/foundation/internal/PushNotification/controller/AdobeNotificationManager;

    const/4 v2, 0x1

    # invokes: Lcom/adobe/creativesdk/foundation/internal/PushNotification/controller/AdobeNotificationManager;->handleActivitiesRequests(Z)V
    invoke-static {v1, v2}, Lcom/adobe/creativesdk/foundation/internal/PushNotification/controller/AdobeNotificationManager;->access$1200(Lcom/adobe/creativesdk/foundation/internal/PushNotification/controller/AdobeNotificationManager;Z)V
    :try_end_50
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_50} :catch_51

    goto :goto_44

    .line 723
    .end local v8    # "notificationsList":Lorg/json/JSONArray;
    .end local v9    # "returnedData":Landroid/util/Pair;, "Landroid/util/Pair<Ljava/lang/Long;Ljava/lang/Integer;>;"
    .end local v10    # "temp":Lorg/json/JSONObject;
    :catch_51
    move-exception v7

    .line 724
    .local v7, "e":Lorg/json/JSONException;
    invoke-virtual {v7}, Lorg/json/JSONException;->printStackTrace()V

    .line 725
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/PushNotification/controller/AdobeNotificationManager$10;->onError()V

    goto :goto_44

    .line 718
    .end local v7    # "e":Lorg/json/JSONException;
    .restart local v8    # "notificationsList":Lorg/json/JSONArray;
    .restart local v9    # "returnedData":Landroid/util/Pair;, "Landroid/util/Pair<Ljava/lang/Long;Ljava/lang/Integer;>;"
    .restart local v10    # "temp":Lorg/json/JSONObject;
    :cond_59
    :try_start_59
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/PushNotification/controller/AdobeNotificationManager$10;->this$0:Lcom/adobe/creativesdk/foundation/internal/PushNotification/controller/AdobeNotificationManager;

    iget-wide v2, p0, Lcom/adobe/creativesdk/foundation/internal/PushNotification/controller/AdobeNotificationManager$10;->val$fromTimeStamp:J

    # getter for: Lcom/adobe/creativesdk/foundation/internal/PushNotification/controller/AdobeNotificationManager;->lastTimeStampFetched:J
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/PushNotification/controller/AdobeNotificationManager;->access$1100()J

    move-result-wide v4

    const-wide/16 v12, 0x1

    sub-long/2addr v4, v12

    iget v6, p0, Lcom/adobe/creativesdk/foundation/internal/PushNotification/controller/AdobeNotificationManager$10;->val$notificationCount:I

    sub-int/2addr v6, v0

    # invokes: Lcom/adobe/creativesdk/foundation/internal/PushNotification/controller/AdobeNotificationManager;->queryNotificationsByPage(JJI)V
    invoke-static/range {v1 .. v6}, Lcom/adobe/creativesdk/foundation/internal/PushNotification/controller/AdobeNotificationManager;->access$1300(Lcom/adobe/creativesdk/foundation/internal/PushNotification/controller/AdobeNotificationManager;JJI)V

    goto :goto_44

    .line 721
    .end local v9    # "returnedData":Landroid/util/Pair;, "Landroid/util/Pair<Ljava/lang/Long;Ljava/lang/Integer;>;"
    :cond_6b
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/PushNotification/controller/AdobeNotificationManager$10;->this$0:Lcom/adobe/creativesdk/foundation/internal/PushNotification/controller/AdobeNotificationManager;

    const/4 v2, 0x1

    # invokes: Lcom/adobe/creativesdk/foundation/internal/PushNotification/controller/AdobeNotificationManager;->handleActivitiesRequests(Z)V
    invoke-static {v1, v2}, Lcom/adobe/creativesdk/foundation/internal/PushNotification/controller/AdobeNotificationManager;->access$1200(Lcom/adobe/creativesdk/foundation/internal/PushNotification/controller/AdobeNotificationManager;Z)V
    :try_end_71
    .catch Lorg/json/JSONException; {:try_start_59 .. :try_end_71} :catch_51

    goto :goto_44
.end method
