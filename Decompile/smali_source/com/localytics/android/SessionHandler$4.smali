.class Lcom/localytics/android/SessionHandler$4;
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

.field final synthetic val$attributes:Ljava/util/Map;

.field final synthetic val$clv:Ljava/lang/Long;

.field final synthetic val$event:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/localytics/android/SessionHandler;Ljava/lang/String;Ljava/util/Map;Ljava/lang/Long;)V
    .registers 5

    .prologue
    .line 482
    iput-object p1, p0, Lcom/localytics/android/SessionHandler$4;->this$0:Lcom/localytics/android/SessionHandler;

    iput-object p2, p0, Lcom/localytics/android/SessionHandler$4;->val$event:Ljava/lang/String;

    iput-object p3, p0, Lcom/localytics/android/SessionHandler$4;->val$attributes:Ljava/util/Map;

    iput-object p4, p0, Lcom/localytics/android/SessionHandler$4;->val$clv:Ljava/lang/Long;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 6

    .prologue
    .line 485
    iget-object v1, p0, Lcom/localytics/android/SessionHandler$4;->this$0:Lcom/localytics/android/SessionHandler;

    iget-object v1, v1, Lcom/localytics/android/SessionHandler;->mProvider:Lcom/localytics/android/LocalyticsProvider;

    invoke-static {v1}, Lcom/localytics/android/SessionHandler;->getOpenSessionId(Lcom/localytics/android/LocalyticsProvider;)Ljava/lang/Long;

    move-result-object v1

    if-eqz v1, :cond_16

    .line 487
    iget-object v1, p0, Lcom/localytics/android/SessionHandler$4;->this$0:Lcom/localytics/android/SessionHandler;

    iget-object v2, p0, Lcom/localytics/android/SessionHandler$4;->val$event:Ljava/lang/String;

    iget-object v3, p0, Lcom/localytics/android/SessionHandler$4;->val$attributes:Ljava/util/Map;

    iget-object v4, p0, Lcom/localytics/android/SessionHandler$4;->val$clv:Ljava/lang/Long;

    invoke-virtual {v1, v2, v3, v4}, Lcom/localytics/android/SessionHandler;->tagEvent(Ljava/lang/String;Ljava/util/Map;Ljava/lang/Long;)V

    .line 561
    :goto_15
    return-void

    .line 495
    :cond_16
    iget-object v1, p0, Lcom/localytics/android/SessionHandler$4;->val$attributes:Ljava/util/Map;

    if-nez v1, :cond_32

    .line 497
    const/4 v0, 0x0

    .line 557
    .local v0, "openCloseAttributes":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    :cond_1b
    :goto_1b
    iget-object v1, p0, Lcom/localytics/android/SessionHandler$4;->this$0:Lcom/localytics/android/SessionHandler;

    const/4 v2, 0x0

    invoke-virtual {v1, v2, v0}, Lcom/localytics/android/SessionHandler;->open(ZLjava/util/Map;)V

    .line 558
    iget-object v1, p0, Lcom/localytics/android/SessionHandler$4;->this$0:Lcom/localytics/android/SessionHandler;

    iget-object v2, p0, Lcom/localytics/android/SessionHandler$4;->val$event:Ljava/lang/String;

    iget-object v3, p0, Lcom/localytics/android/SessionHandler$4;->val$attributes:Ljava/util/Map;

    iget-object v4, p0, Lcom/localytics/android/SessionHandler$4;->val$clv:Ljava/lang/Long;

    invoke-virtual {v1, v2, v3, v4}, Lcom/localytics/android/SessionHandler;->tagEvent(Ljava/lang/String;Ljava/util/Map;Ljava/lang/Long;)V

    .line 559
    iget-object v1, p0, Lcom/localytics/android/SessionHandler$4;->this$0:Lcom/localytics/android/SessionHandler;

    invoke-virtual {v1, v0}, Lcom/localytics/android/SessionHandler;->close(Ljava/util/Map;)V

    goto :goto_15

    .line 499
    .end local v0    # "openCloseAttributes":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    :cond_32
    iget-object v1, p0, Lcom/localytics/android/SessionHandler$4;->val$attributes:Ljava/util/Map;

    sget-object v2, Lcom/localytics/android/LocalyticsProvider$AttributesDbColumns;->ATTRIBUTE_CUSTOM_DIMENSION_1:Ljava/lang/String;

    invoke-interface {v1, v2}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_96

    iget-object v1, p0, Lcom/localytics/android/SessionHandler$4;->val$attributes:Ljava/util/Map;

    sget-object v2, Lcom/localytics/android/LocalyticsProvider$AttributesDbColumns;->ATTRIBUTE_CUSTOM_DIMENSION_2:Ljava/lang/String;

    invoke-interface {v1, v2}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_96

    iget-object v1, p0, Lcom/localytics/android/SessionHandler$4;->val$attributes:Ljava/util/Map;

    sget-object v2, Lcom/localytics/android/LocalyticsProvider$AttributesDbColumns;->ATTRIBUTE_CUSTOM_DIMENSION_3:Ljava/lang/String;

    invoke-interface {v1, v2}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_96

    iget-object v1, p0, Lcom/localytics/android/SessionHandler$4;->val$attributes:Ljava/util/Map;

    sget-object v2, Lcom/localytics/android/LocalyticsProvider$AttributesDbColumns;->ATTRIBUTE_CUSTOM_DIMENSION_4:Ljava/lang/String;

    invoke-interface {v1, v2}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_96

    iget-object v1, p0, Lcom/localytics/android/SessionHandler$4;->val$attributes:Ljava/util/Map;

    sget-object v2, Lcom/localytics/android/LocalyticsProvider$AttributesDbColumns;->ATTRIBUTE_CUSTOM_DIMENSION_5:Ljava/lang/String;

    invoke-interface {v1, v2}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_96

    iget-object v1, p0, Lcom/localytics/android/SessionHandler$4;->val$attributes:Ljava/util/Map;

    sget-object v2, Lcom/localytics/android/LocalyticsProvider$AttributesDbColumns;->ATTRIBUTE_CUSTOM_DIMENSION_6:Ljava/lang/String;

    invoke-interface {v1, v2}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_96

    iget-object v1, p0, Lcom/localytics/android/SessionHandler$4;->val$attributes:Ljava/util/Map;

    sget-object v2, Lcom/localytics/android/LocalyticsProvider$AttributesDbColumns;->ATTRIBUTE_CUSTOM_DIMENSION_7:Ljava/lang/String;

    invoke-interface {v1, v2}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_96

    iget-object v1, p0, Lcom/localytics/android/SessionHandler$4;->val$attributes:Ljava/util/Map;

    sget-object v2, Lcom/localytics/android/LocalyticsProvider$AttributesDbColumns;->ATTRIBUTE_CUSTOM_DIMENSION_8:Ljava/lang/String;

    invoke-interface {v1, v2}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_96

    iget-object v1, p0, Lcom/localytics/android/SessionHandler$4;->val$attributes:Ljava/util/Map;

    sget-object v2, Lcom/localytics/android/LocalyticsProvider$AttributesDbColumns;->ATTRIBUTE_CUSTOM_DIMENSION_9:Ljava/lang/String;

    invoke-interface {v1, v2}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_96

    iget-object v1, p0, Lcom/localytics/android/SessionHandler$4;->val$attributes:Ljava/util/Map;

    sget-object v2, Lcom/localytics/android/LocalyticsProvider$AttributesDbColumns;->ATTRIBUTE_CUSTOM_DIMENSION_10:Ljava/lang/String;

    invoke-interface {v1, v2}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_183

    .line 510
    :cond_96
    new-instance v0, Ljava/util/TreeMap;

    invoke-direct {v0}, Ljava/util/TreeMap;-><init>()V

    .line 511
    .restart local v0    # "openCloseAttributes":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    iget-object v1, p0, Lcom/localytics/android/SessionHandler$4;->val$attributes:Ljava/util/Map;

    sget-object v2, Lcom/localytics/android/LocalyticsProvider$AttributesDbColumns;->ATTRIBUTE_CUSTOM_DIMENSION_1:Ljava/lang/String;

    invoke-interface {v1, v2}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_b2

    .line 513
    sget-object v1, Lcom/localytics/android/LocalyticsProvider$AttributesDbColumns;->ATTRIBUTE_CUSTOM_DIMENSION_1:Ljava/lang/String;

    iget-object v2, p0, Lcom/localytics/android/SessionHandler$4;->val$attributes:Ljava/util/Map;

    sget-object v3, Lcom/localytics/android/LocalyticsProvider$AttributesDbColumns;->ATTRIBUTE_CUSTOM_DIMENSION_1:Ljava/lang/String;

    invoke-interface {v2, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 515
    :cond_b2
    iget-object v1, p0, Lcom/localytics/android/SessionHandler$4;->val$attributes:Ljava/util/Map;

    sget-object v2, Lcom/localytics/android/LocalyticsProvider$AttributesDbColumns;->ATTRIBUTE_CUSTOM_DIMENSION_2:Ljava/lang/String;

    invoke-interface {v1, v2}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_c9

    .line 517
    sget-object v1, Lcom/localytics/android/LocalyticsProvider$AttributesDbColumns;->ATTRIBUTE_CUSTOM_DIMENSION_2:Ljava/lang/String;

    iget-object v2, p0, Lcom/localytics/android/SessionHandler$4;->val$attributes:Ljava/util/Map;

    sget-object v3, Lcom/localytics/android/LocalyticsProvider$AttributesDbColumns;->ATTRIBUTE_CUSTOM_DIMENSION_2:Ljava/lang/String;

    invoke-interface {v2, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 519
    :cond_c9
    iget-object v1, p0, Lcom/localytics/android/SessionHandler$4;->val$attributes:Ljava/util/Map;

    sget-object v2, Lcom/localytics/android/LocalyticsProvider$AttributesDbColumns;->ATTRIBUTE_CUSTOM_DIMENSION_3:Ljava/lang/String;

    invoke-interface {v1, v2}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_e0

    .line 521
    sget-object v1, Lcom/localytics/android/LocalyticsProvider$AttributesDbColumns;->ATTRIBUTE_CUSTOM_DIMENSION_3:Ljava/lang/String;

    iget-object v2, p0, Lcom/localytics/android/SessionHandler$4;->val$attributes:Ljava/util/Map;

    sget-object v3, Lcom/localytics/android/LocalyticsProvider$AttributesDbColumns;->ATTRIBUTE_CUSTOM_DIMENSION_3:Ljava/lang/String;

    invoke-interface {v2, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 523
    :cond_e0
    iget-object v1, p0, Lcom/localytics/android/SessionHandler$4;->val$attributes:Ljava/util/Map;

    sget-object v2, Lcom/localytics/android/LocalyticsProvider$AttributesDbColumns;->ATTRIBUTE_CUSTOM_DIMENSION_4:Ljava/lang/String;

    invoke-interface {v1, v2}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_f7

    .line 525
    sget-object v1, Lcom/localytics/android/LocalyticsProvider$AttributesDbColumns;->ATTRIBUTE_CUSTOM_DIMENSION_4:Ljava/lang/String;

    iget-object v2, p0, Lcom/localytics/android/SessionHandler$4;->val$attributes:Ljava/util/Map;

    sget-object v3, Lcom/localytics/android/LocalyticsProvider$AttributesDbColumns;->ATTRIBUTE_CUSTOM_DIMENSION_4:Ljava/lang/String;

    invoke-interface {v2, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 527
    :cond_f7
    iget-object v1, p0, Lcom/localytics/android/SessionHandler$4;->val$attributes:Ljava/util/Map;

    sget-object v2, Lcom/localytics/android/LocalyticsProvider$AttributesDbColumns;->ATTRIBUTE_CUSTOM_DIMENSION_5:Ljava/lang/String;

    invoke-interface {v1, v2}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_10e

    .line 529
    sget-object v1, Lcom/localytics/android/LocalyticsProvider$AttributesDbColumns;->ATTRIBUTE_CUSTOM_DIMENSION_5:Ljava/lang/String;

    iget-object v2, p0, Lcom/localytics/android/SessionHandler$4;->val$attributes:Ljava/util/Map;

    sget-object v3, Lcom/localytics/android/LocalyticsProvider$AttributesDbColumns;->ATTRIBUTE_CUSTOM_DIMENSION_5:Ljava/lang/String;

    invoke-interface {v2, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 531
    :cond_10e
    iget-object v1, p0, Lcom/localytics/android/SessionHandler$4;->val$attributes:Ljava/util/Map;

    sget-object v2, Lcom/localytics/android/LocalyticsProvider$AttributesDbColumns;->ATTRIBUTE_CUSTOM_DIMENSION_6:Ljava/lang/String;

    invoke-interface {v1, v2}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_125

    .line 533
    sget-object v1, Lcom/localytics/android/LocalyticsProvider$AttributesDbColumns;->ATTRIBUTE_CUSTOM_DIMENSION_6:Ljava/lang/String;

    iget-object v2, p0, Lcom/localytics/android/SessionHandler$4;->val$attributes:Ljava/util/Map;

    sget-object v3, Lcom/localytics/android/LocalyticsProvider$AttributesDbColumns;->ATTRIBUTE_CUSTOM_DIMENSION_6:Ljava/lang/String;

    invoke-interface {v2, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 535
    :cond_125
    iget-object v1, p0, Lcom/localytics/android/SessionHandler$4;->val$attributes:Ljava/util/Map;

    sget-object v2, Lcom/localytics/android/LocalyticsProvider$AttributesDbColumns;->ATTRIBUTE_CUSTOM_DIMENSION_7:Ljava/lang/String;

    invoke-interface {v1, v2}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_13c

    .line 537
    sget-object v1, Lcom/localytics/android/LocalyticsProvider$AttributesDbColumns;->ATTRIBUTE_CUSTOM_DIMENSION_7:Ljava/lang/String;

    iget-object v2, p0, Lcom/localytics/android/SessionHandler$4;->val$attributes:Ljava/util/Map;

    sget-object v3, Lcom/localytics/android/LocalyticsProvider$AttributesDbColumns;->ATTRIBUTE_CUSTOM_DIMENSION_7:Ljava/lang/String;

    invoke-interface {v2, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 539
    :cond_13c
    iget-object v1, p0, Lcom/localytics/android/SessionHandler$4;->val$attributes:Ljava/util/Map;

    sget-object v2, Lcom/localytics/android/LocalyticsProvider$AttributesDbColumns;->ATTRIBUTE_CUSTOM_DIMENSION_8:Ljava/lang/String;

    invoke-interface {v1, v2}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_153

    .line 541
    sget-object v1, Lcom/localytics/android/LocalyticsProvider$AttributesDbColumns;->ATTRIBUTE_CUSTOM_DIMENSION_8:Ljava/lang/String;

    iget-object v2, p0, Lcom/localytics/android/SessionHandler$4;->val$attributes:Ljava/util/Map;

    sget-object v3, Lcom/localytics/android/LocalyticsProvider$AttributesDbColumns;->ATTRIBUTE_CUSTOM_DIMENSION_8:Ljava/lang/String;

    invoke-interface {v2, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 543
    :cond_153
    iget-object v1, p0, Lcom/localytics/android/SessionHandler$4;->val$attributes:Ljava/util/Map;

    sget-object v2, Lcom/localytics/android/LocalyticsProvider$AttributesDbColumns;->ATTRIBUTE_CUSTOM_DIMENSION_9:Ljava/lang/String;

    invoke-interface {v1, v2}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_16a

    .line 545
    sget-object v1, Lcom/localytics/android/LocalyticsProvider$AttributesDbColumns;->ATTRIBUTE_CUSTOM_DIMENSION_9:Ljava/lang/String;

    iget-object v2, p0, Lcom/localytics/android/SessionHandler$4;->val$attributes:Ljava/util/Map;

    sget-object v3, Lcom/localytics/android/LocalyticsProvider$AttributesDbColumns;->ATTRIBUTE_CUSTOM_DIMENSION_9:Ljava/lang/String;

    invoke-interface {v2, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 547
    :cond_16a
    iget-object v1, p0, Lcom/localytics/android/SessionHandler$4;->val$attributes:Ljava/util/Map;

    sget-object v2, Lcom/localytics/android/LocalyticsProvider$AttributesDbColumns;->ATTRIBUTE_CUSTOM_DIMENSION_10:Ljava/lang/String;

    invoke-interface {v1, v2}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1b

    .line 549
    sget-object v1, Lcom/localytics/android/LocalyticsProvider$AttributesDbColumns;->ATTRIBUTE_CUSTOM_DIMENSION_10:Ljava/lang/String;

    iget-object v2, p0, Lcom/localytics/android/SessionHandler$4;->val$attributes:Ljava/util/Map;

    sget-object v3, Lcom/localytics/android/LocalyticsProvider$AttributesDbColumns;->ATTRIBUTE_CUSTOM_DIMENSION_10:Ljava/lang/String;

    invoke-interface {v2, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto/16 :goto_1b

    .line 554
    .end local v0    # "openCloseAttributes":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    :cond_183
    const/4 v0, 0x0

    .restart local v0    # "openCloseAttributes":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    goto/16 :goto_1b
.end method
