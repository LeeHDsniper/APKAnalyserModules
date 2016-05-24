.class public Lcom/google/android/gms/common/api/GoogleApiClient$ServerAuthCodeCallbacks$CheckResult;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/gms/common/api/GoogleApiClient$ServerAuthCodeCallbacks;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "CheckResult"
.end annotation


# instance fields
.field private zzZo:Z

.field private zzZp:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set",
            "<",
            "Lcom/google/android/gms/common/api/Scope;",
            ">;"
        }
    .end annotation
.end field


# virtual methods
.method public zznl()Z
    .registers 2

    iget-boolean v0, p0, Lcom/google/android/gms/common/api/GoogleApiClient$ServerAuthCodeCallbacks$CheckResult;->zzZo:Z

    return v0
.end method

.method public zznm()Ljava/util/Set;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set",
            "<",
            "Lcom/google/android/gms/common/api/Scope;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lcom/google/android/gms/common/api/GoogleApiClient$ServerAuthCodeCallbacks$CheckResult;->zzZp:Ljava/util/Set;

    return-object v0
.end method
