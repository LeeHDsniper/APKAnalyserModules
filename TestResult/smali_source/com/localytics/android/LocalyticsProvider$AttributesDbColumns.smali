.class public final Lcom/localytics/android/LocalyticsProvider$AttributesDbColumns;
.super Ljava/lang/Object;
.source "LocalyticsProvider.java"

# interfaces
.implements Landroid/provider/BaseColumns;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/localytics/android/LocalyticsProvider;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "AttributesDbColumns"
.end annotation


# static fields
.field static final ATTRIBUTE_CUSTOM_DIMENSION_1:Ljava/lang/String;

.field static final ATTRIBUTE_CUSTOM_DIMENSION_10:Ljava/lang/String;

.field static final ATTRIBUTE_CUSTOM_DIMENSION_2:Ljava/lang/String;

.field static final ATTRIBUTE_CUSTOM_DIMENSION_3:Ljava/lang/String;

.field static final ATTRIBUTE_CUSTOM_DIMENSION_4:Ljava/lang/String;

.field static final ATTRIBUTE_CUSTOM_DIMENSION_5:Ljava/lang/String;

.field static final ATTRIBUTE_CUSTOM_DIMENSION_6:Ljava/lang/String;

.field static final ATTRIBUTE_CUSTOM_DIMENSION_7:Ljava/lang/String;

.field static final ATTRIBUTE_CUSTOM_DIMENSION_8:Ljava/lang/String;

.field static final ATTRIBUTE_CUSTOM_DIMENSION_9:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 6

    .prologue
    const/4 v5, 0x2

    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 1391
    const-string v0, "%s:%s"

    new-array v1, v5, [Ljava/lang/Object;

    const-string v2, "com.localytics.android"

    aput-object v2, v1, v3

    const-string v2, "custom_dimension_0"

    aput-object v2, v1, v4

    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/localytics/android/LocalyticsProvider$AttributesDbColumns;->ATTRIBUTE_CUSTOM_DIMENSION_1:Ljava/lang/String;

    .line 1396
    const-string v0, "%s:%s"

    new-array v1, v5, [Ljava/lang/Object;

    const-string v2, "com.localytics.android"

    aput-object v2, v1, v3

    const-string v2, "custom_dimension_1"

    aput-object v2, v1, v4

    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/localytics/android/LocalyticsProvider$AttributesDbColumns;->ATTRIBUTE_CUSTOM_DIMENSION_2:Ljava/lang/String;

    .line 1401
    const-string v0, "%s:%s"

    new-array v1, v5, [Ljava/lang/Object;

    const-string v2, "com.localytics.android"

    aput-object v2, v1, v3

    const-string v2, "custom_dimension_2"

    aput-object v2, v1, v4

    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/localytics/android/LocalyticsProvider$AttributesDbColumns;->ATTRIBUTE_CUSTOM_DIMENSION_3:Ljava/lang/String;

    .line 1406
    const-string v0, "%s:%s"

    new-array v1, v5, [Ljava/lang/Object;

    const-string v2, "com.localytics.android"

    aput-object v2, v1, v3

    const-string v2, "custom_dimension_3"

    aput-object v2, v1, v4

    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/localytics/android/LocalyticsProvider$AttributesDbColumns;->ATTRIBUTE_CUSTOM_DIMENSION_4:Ljava/lang/String;

    .line 1411
    const-string v0, "%s:%s"

    new-array v1, v5, [Ljava/lang/Object;

    const-string v2, "com.localytics.android"

    aput-object v2, v1, v3

    const-string v2, "custom_dimension_4"

    aput-object v2, v1, v4

    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/localytics/android/LocalyticsProvider$AttributesDbColumns;->ATTRIBUTE_CUSTOM_DIMENSION_5:Ljava/lang/String;

    .line 1416
    const-string v0, "%s:%s"

    new-array v1, v5, [Ljava/lang/Object;

    const-string v2, "com.localytics.android"

    aput-object v2, v1, v3

    const-string v2, "custom_dimension_5"

    aput-object v2, v1, v4

    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/localytics/android/LocalyticsProvider$AttributesDbColumns;->ATTRIBUTE_CUSTOM_DIMENSION_6:Ljava/lang/String;

    .line 1421
    const-string v0, "%s:%s"

    new-array v1, v5, [Ljava/lang/Object;

    const-string v2, "com.localytics.android"

    aput-object v2, v1, v3

    const-string v2, "custom_dimension_6"

    aput-object v2, v1, v4

    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/localytics/android/LocalyticsProvider$AttributesDbColumns;->ATTRIBUTE_CUSTOM_DIMENSION_7:Ljava/lang/String;

    .line 1426
    const-string v0, "%s:%s"

    new-array v1, v5, [Ljava/lang/Object;

    const-string v2, "com.localytics.android"

    aput-object v2, v1, v3

    const-string v2, "custom_dimension_7"

    aput-object v2, v1, v4

    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/localytics/android/LocalyticsProvider$AttributesDbColumns;->ATTRIBUTE_CUSTOM_DIMENSION_8:Ljava/lang/String;

    .line 1431
    const-string v0, "%s:%s"

    new-array v1, v5, [Ljava/lang/Object;

    const-string v2, "com.localytics.android"

    aput-object v2, v1, v3

    const-string v2, "custom_dimension_8"

    aput-object v2, v1, v4

    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/localytics/android/LocalyticsProvider$AttributesDbColumns;->ATTRIBUTE_CUSTOM_DIMENSION_9:Ljava/lang/String;

    .line 1436
    const-string v0, "%s:%s"

    new-array v1, v5, [Ljava/lang/Object;

    const-string v2, "com.localytics.android"

    aput-object v2, v1, v3

    const-string v2, "custom_dimension_9"

    aput-object v2, v1, v4

    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/localytics/android/LocalyticsProvider$AttributesDbColumns;->ATTRIBUTE_CUSTOM_DIMENSION_10:Ljava/lang/String;

    return-void
.end method
