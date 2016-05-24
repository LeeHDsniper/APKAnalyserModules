.class Lcom/facebook/AppEventsLogger$SessionEventsState;
.super Ljava/lang/Object;
.source "AppEventsLogger.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/facebook/AppEventsLogger;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "SessionEventsState"
.end annotation


# instance fields
.field private final MAX_ACCUMULATED_LOG_EVENTS:I

.field private accumulatedEvents:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/facebook/AppEventsLogger$AppEvent;",
            ">;"
        }
    .end annotation
.end field

.field private attributionIdentifiers:Lcom/facebook/internal/AttributionIdentifiers;

.field private hashedDeviceAndAppId:Ljava/lang/String;

.field private inFlightEvents:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/facebook/AppEventsLogger$AppEvent;",
            ">;"
        }
    .end annotation
.end field

.field private numSkippedEventsDueToFullBuffer:I

.field private packageName:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lcom/facebook/internal/AttributionIdentifiers;Ljava/lang/String;Ljava/lang/String;)V
    .registers 5
    .param p1, "identifiers"    # Lcom/facebook/internal/AttributionIdentifiers;
    .param p2, "packageName"    # Ljava/lang/String;
    .param p3, "hashedDeviceAndAppId"    # Ljava/lang/String;

    .prologue
    .line 1061
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1048
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/facebook/AppEventsLogger$SessionEventsState;->accumulatedEvents:Ljava/util/List;

    .line 1049
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/facebook/AppEventsLogger$SessionEventsState;->inFlightEvents:Ljava/util/List;

    .line 1059
    const/16 v0, 0x3e8

    iput v0, p0, Lcom/facebook/AppEventsLogger$SessionEventsState;->MAX_ACCUMULATED_LOG_EVENTS:I

    .line 1062
    iput-object p1, p0, Lcom/facebook/AppEventsLogger$SessionEventsState;->attributionIdentifiers:Lcom/facebook/internal/AttributionIdentifiers;

    .line 1063
    iput-object p2, p0, Lcom/facebook/AppEventsLogger$SessionEventsState;->packageName:Ljava/lang/String;

    .line 1064
    iput-object p3, p0, Lcom/facebook/AppEventsLogger$SessionEventsState;->hashedDeviceAndAppId:Ljava/lang/String;

    .line 1065
    return-void
.end method

.method private getStringAsByteArray(Ljava/lang/String;)[B
    .registers 5
    .param p1, "jsonString"    # Ljava/lang/String;

    .prologue
    .line 1173
    const/4 v1, 0x0

    .line 1175
    .local v1, "jsonUtf8":[B
    :try_start_1
    const-string v2, "UTF-8"

    invoke-virtual {p1, v2}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B
    :try_end_6
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_1 .. :try_end_6} :catch_8

    move-result-object v1

    .line 1180
    :goto_7
    return-object v1

    .line 1176
    :catch_8
    move-exception v0

    .line 1178
    .local v0, "e":Ljava/io/UnsupportedEncodingException;
    const-string v2, "Encoding exception: "

    invoke-static {v2, v0}, Lcom/facebook/internal/Utility;->logd(Ljava/lang/String;Ljava/lang/Exception;)V

    goto :goto_7
.end method

.method private populateRequest(Lcom/facebook/Request;ILorg/json/JSONArray;ZZ)V
    .registers 11
    .param p1, "request"    # Lcom/facebook/Request;
    .param p2, "numSkipped"    # I
    .param p3, "events"    # Lorg/json/JSONArray;
    .param p4, "includeAttribution"    # Z
    .param p5, "limitEventUsage"    # Z

    .prologue
    .line 1134
    invoke-static {}, Lcom/facebook/model/GraphObject$Factory;->create()Lcom/facebook/model/GraphObject;

    move-result-object v1

    .line 1135
    .local v1, "publishParams":Lcom/facebook/model/GraphObject;
    const-string v3, "event"

    const-string v4, "CUSTOM_APP_EVENTS"

    invoke-interface {v1, v3, v4}, Lcom/facebook/model/GraphObject;->setProperty(Ljava/lang/String;Ljava/lang/Object;)V

    .line 1137
    iget v3, p0, Lcom/facebook/AppEventsLogger$SessionEventsState;->numSkippedEventsDueToFullBuffer:I

    if-lez v3, :cond_18

    .line 1138
    const-string v3, "num_skipped_events"

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-interface {v1, v3, v4}, Lcom/facebook/model/GraphObject;->setProperty(Ljava/lang/String;Ljava/lang/Object;)V

    .line 1141
    :cond_18
    if-eqz p4, :cond_21

    .line 1142
    iget-object v3, p0, Lcom/facebook/AppEventsLogger$SessionEventsState;->attributionIdentifiers:Lcom/facebook/internal/AttributionIdentifiers;

    .line 1143
    iget-object v4, p0, Lcom/facebook/AppEventsLogger$SessionEventsState;->hashedDeviceAndAppId:Ljava/lang/String;

    .line 1142
    invoke-static {v1, v3, v4, p5}, Lcom/facebook/internal/Utility;->setAppEventAttributionParameters(Lcom/facebook/model/GraphObject;Lcom/facebook/internal/AttributionIdentifiers;Ljava/lang/String;Z)V

    .line 1150
    :cond_21
    :try_start_21
    # getter for: Lcom/facebook/AppEventsLogger;->applicationContext:Landroid/content/Context;
    invoke-static {}, Lcom/facebook/AppEventsLogger;->access$0()Landroid/content/Context;

    move-result-object v3

    invoke-static {v1, v3}, Lcom/facebook/internal/Utility;->setAppEventExtendedDeviceInfoParameters(Lcom/facebook/model/GraphObject;Landroid/content/Context;)V
    :try_end_28
    .catch Ljava/lang/Exception; {:try_start_21 .. :try_end_28} :catch_53

    .line 1155
    :goto_28
    const-string v3, "application_package_name"

    iget-object v4, p0, Lcom/facebook/AppEventsLogger$SessionEventsState;->packageName:Ljava/lang/String;

    invoke-interface {v1, v3, v4}, Lcom/facebook/model/GraphObject;->setProperty(Ljava/lang/String;Ljava/lang/Object;)V

    .line 1157
    invoke-virtual {p1, v1}, Lcom/facebook/Request;->setGraphObject(Lcom/facebook/model/GraphObject;)V

    .line 1159
    invoke-virtual {p1}, Lcom/facebook/Request;->getParameters()Landroid/os/Bundle;

    move-result-object v2

    .line 1160
    .local v2, "requestParameters":Landroid/os/Bundle;
    if-nez v2, :cond_3d

    .line 1161
    new-instance v2, Landroid/os/Bundle;

    .end local v2    # "requestParameters":Landroid/os/Bundle;
    invoke-direct {v2}, Landroid/os/Bundle;-><init>()V

    .line 1164
    .restart local v2    # "requestParameters":Landroid/os/Bundle;
    :cond_3d
    invoke-virtual {p3}, Lorg/json/JSONArray;->toString()Ljava/lang/String;

    move-result-object v0

    .line 1165
    .local v0, "jsonString":Ljava/lang/String;
    if-eqz v0, :cond_4f

    .line 1166
    const-string v3, "custom_events_file"

    invoke-direct {p0, v0}, Lcom/facebook/AppEventsLogger$SessionEventsState;->getStringAsByteArray(Ljava/lang/String;)[B

    move-result-object v4

    invoke-virtual {v2, v3, v4}, Landroid/os/Bundle;->putByteArray(Ljava/lang/String;[B)V

    .line 1167
    invoke-virtual {p1, v0}, Lcom/facebook/Request;->setTag(Ljava/lang/Object;)V

    .line 1169
    :cond_4f
    invoke-virtual {p1, v2}, Lcom/facebook/Request;->setParameters(Landroid/os/Bundle;)V

    .line 1170
    return-void

    .line 1151
    .end local v0    # "jsonString":Ljava/lang/String;
    .end local v2    # "requestParameters":Landroid/os/Bundle;
    :catch_53
    move-exception v3

    goto :goto_28
.end method


# virtual methods
.method public declared-synchronized accumulatePersistedEvents(Ljava/util/List;)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/facebook/AppEventsLogger$AppEvent;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 1129
    .local p1, "events":Ljava/util/List;, "Ljava/util/List<Lcom/facebook/AppEventsLogger$AppEvent;>;"
    monitor-enter p0

    :try_start_1
    iget-object v0, p0, Lcom/facebook/AppEventsLogger$SessionEventsState;->accumulatedEvents:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z
    :try_end_6
    .catchall {:try_start_1 .. :try_end_6} :catchall_8

    .line 1130
    monitor-exit p0

    return-void

    .line 1129
    :catchall_8
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized addEvent(Lcom/facebook/AppEventsLogger$AppEvent;)V
    .registers 4
    .param p1, "event"    # Lcom/facebook/AppEventsLogger$AppEvent;

    .prologue
    .line 1070
    monitor-enter p0

    :try_start_1
    iget-object v0, p0, Lcom/facebook/AppEventsLogger$SessionEventsState;->accumulatedEvents:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    iget-object v1, p0, Lcom/facebook/AppEventsLogger$SessionEventsState;->inFlightEvents:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    add-int/2addr v0, v1

    const/16 v1, 0x3e8

    if-lt v0, v1, :cond_1a

    .line 1071
    iget v0, p0, Lcom/facebook/AppEventsLogger$SessionEventsState;->numSkippedEventsDueToFullBuffer:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/facebook/AppEventsLogger$SessionEventsState;->numSkippedEventsDueToFullBuffer:I
    :try_end_18
    .catchall {:try_start_1 .. :try_end_18} :catchall_20

    .line 1075
    :goto_18
    monitor-exit p0

    return-void

    .line 1073
    :cond_1a
    :try_start_1a
    iget-object v0, p0, Lcom/facebook/AppEventsLogger$SessionEventsState;->accumulatedEvents:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_1f
    .catchall {:try_start_1a .. :try_end_1f} :catchall_20

    goto :goto_18

    .line 1070
    :catchall_20
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized clearInFlightAndStats(Z)V
    .registers 4
    .param p1, "moveToAccumulated"    # Z

    .prologue
    .line 1082
    monitor-enter p0

    if-eqz p1, :cond_a

    .line 1083
    :try_start_3
    iget-object v0, p0, Lcom/facebook/AppEventsLogger$SessionEventsState;->accumulatedEvents:Ljava/util/List;

    iget-object v1, p0, Lcom/facebook/AppEventsLogger$SessionEventsState;->inFlightEvents:Ljava/util/List;

    invoke-interface {v0, v1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 1085
    :cond_a
    iget-object v0, p0, Lcom/facebook/AppEventsLogger$SessionEventsState;->inFlightEvents:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 1086
    const/4 v0, 0x0

    iput v0, p0, Lcom/facebook/AppEventsLogger$SessionEventsState;->numSkippedEventsDueToFullBuffer:I
    :try_end_12
    .catchall {:try_start_3 .. :try_end_12} :catchall_14

    .line 1087
    monitor-exit p0

    return-void

    .line 1082
    :catchall_14
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized getAccumulatedEventCount()I
    .registers 2

    .prologue
    .line 1078
    monitor-enter p0

    :try_start_1
    iget-object v0, p0, Lcom/facebook/AppEventsLogger$SessionEventsState;->accumulatedEvents:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I
    :try_end_6
    .catchall {:try_start_1 .. :try_end_6} :catchall_9

    move-result v0

    monitor-exit p0

    return v0

    :catchall_9
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized getEventsToPersist()Ljava/util/List;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lcom/facebook/AppEventsLogger$AppEvent;",
            ">;"
        }
    .end annotation

    .prologue
    .line 1121
    monitor-enter p0

    :try_start_1
    iget-object v0, p0, Lcom/facebook/AppEventsLogger$SessionEventsState;->accumulatedEvents:Ljava/util/List;

    .line 1122
    .local v0, "result":Ljava/util/List;, "Ljava/util/List<Lcom/facebook/AppEventsLogger$AppEvent;>;"
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    iput-object v1, p0, Lcom/facebook/AppEventsLogger$SessionEventsState;->accumulatedEvents:Ljava/util/List;
    :try_end_a
    .catchall {:try_start_1 .. :try_end_a} :catchall_c

    .line 1123
    monitor-exit p0

    return-object v0

    .line 1121
    .end local v0    # "result":Ljava/util/List;, "Ljava/util/List<Lcom/facebook/AppEventsLogger$AppEvent;>;"
    :catchall_c
    move-exception v1

    monitor-exit p0

    throw v1
.end method

.method public populateRequest(Lcom/facebook/Request;ZZZ)I
    .registers 12
    .param p1, "request"    # Lcom/facebook/Request;
    .param p2, "includeImplicitEvents"    # Z
    .param p3, "includeAttribution"    # Z
    .param p4, "limitEventUsage"    # Z

    .prologue
    .line 1094
    monitor-enter p0

    .line 1095
    :try_start_1
    iget v2, p0, Lcom/facebook/AppEventsLogger$SessionEventsState;->numSkippedEventsDueToFullBuffer:I

    .line 1098
    .local v2, "numSkipped":I
    iget-object v0, p0, Lcom/facebook/AppEventsLogger$SessionEventsState;->inFlightEvents:Ljava/util/List;

    iget-object v1, p0, Lcom/facebook/AppEventsLogger$SessionEventsState;->accumulatedEvents:Ljava/util/List;

    invoke-interface {v0, v1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 1099
    iget-object v0, p0, Lcom/facebook/AppEventsLogger$SessionEventsState;->accumulatedEvents:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 1101
    new-instance v3, Lorg/json/JSONArray;

    invoke-direct {v3}, Lorg/json/JSONArray;-><init>()V

    .line 1102
    .local v3, "jsonArray":Lorg/json/JSONArray;
    iget-object v0, p0, Lcom/facebook/AppEventsLogger$SessionEventsState;->inFlightEvents:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_1a
    :goto_1a
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-nez v1, :cond_29

    .line 1108
    invoke-virtual {v3}, Lorg/json/JSONArray;->length()I

    move-result v0

    if-nez v0, :cond_42

    .line 1109
    monitor-exit p0

    const/4 v0, 0x0

    .line 1114
    :goto_28
    return v0

    .line 1102
    :cond_29
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/facebook/AppEventsLogger$AppEvent;

    .line 1103
    .local v6, "event":Lcom/facebook/AppEventsLogger$AppEvent;
    if-nez p2, :cond_37

    invoke-virtual {v6}, Lcom/facebook/AppEventsLogger$AppEvent;->getIsImplicit()Z

    move-result v1

    if-nez v1, :cond_1a

    .line 1104
    :cond_37
    invoke-virtual {v6}, Lcom/facebook/AppEventsLogger$AppEvent;->getJSONObject()Lorg/json/JSONObject;

    move-result-object v1

    invoke-virtual {v3, v1}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    goto :goto_1a

    .line 1094
    .end local v2    # "numSkipped":I
    .end local v3    # "jsonArray":Lorg/json/JSONArray;
    .end local v6    # "event":Lcom/facebook/AppEventsLogger$AppEvent;
    :catchall_3f
    move-exception v0

    monitor-exit p0
    :try_end_41
    .catchall {:try_start_1 .. :try_end_41} :catchall_3f

    throw v0

    .restart local v2    # "numSkipped":I
    .restart local v3    # "jsonArray":Lorg/json/JSONArray;
    :cond_42
    :try_start_42
    monitor-exit p0
    :try_end_43
    .catchall {:try_start_42 .. :try_end_43} :catchall_3f

    move-object v0, p0

    move-object v1, p1

    move v4, p3

    move v5, p4

    .line 1113
    invoke-direct/range {v0 .. v5}, Lcom/facebook/AppEventsLogger$SessionEventsState;->populateRequest(Lcom/facebook/Request;ILorg/json/JSONArray;ZZ)V

    .line 1114
    invoke-virtual {v3}, Lorg/json/JSONArray;->length()I

    move-result v0

    goto :goto_28
.end method
