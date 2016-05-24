.class Lcom/google/android/gms/tagmanager/zzs;
.super Ljava/lang/Object;


# instance fields
.field private zzaPw:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-string v0, "https://www.googletagmanager.com"

    iput-object v0, p0, Lcom/google/android/gms/tagmanager/zzs;->zzaPw:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public zzzN()Ljava/lang/String;
    .registers 2

    iget-object v0, p0, Lcom/google/android/gms/tagmanager/zzs;->zzaPw:Ljava/lang/String;

    return-object v0
.end method
