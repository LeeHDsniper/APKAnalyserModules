.class Lcom/localytics/android/UploadHandler$ProfileUploadDataPair;
.super Ljava/lang/Object;
.source "UploadHandler.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/localytics/android/UploadHandler;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "ProfileUploadDataPair"
.end annotation


# instance fields
.field public consolidatedJSON:Lorg/json/JSONObject;

.field public rowIDs:Ljava/lang/StringBuilder;


# direct methods
.method public constructor <init>(Lorg/json/JSONObject;Ljava/lang/StringBuilder;)V
    .registers 3
    .param p1, "json"    # Lorg/json/JSONObject;
    .param p2, "rows"    # Ljava/lang/StringBuilder;

    .prologue
    .line 881
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 882
    iput-object p1, p0, Lcom/localytics/android/UploadHandler$ProfileUploadDataPair;->consolidatedJSON:Lorg/json/JSONObject;

    .line 883
    iput-object p2, p0, Lcom/localytics/android/UploadHandler$ProfileUploadDataPair;->rowIDs:Ljava/lang/StringBuilder;

    .line 884
    return-void
.end method
